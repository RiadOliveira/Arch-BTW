#!/bin/bash
set -e

get_partition_name() {
  local base=$1
  local number=$2
  [[ "$base" =~ nvme.* ]] && echo "/dev/${base}p${number}" || echo "/dev/${base}${number}"
}

read -p "Enter the device name for installation (e.g., sda, nvme0n1): " DEVICE
DEVICE_PATH="/dev/$DEVICE"

read -p "Do you want to delete all partitions and wipe the partition table? (y/N): " WIPE

read -p "Do you want to create a Boot partition (ef00)? (y/N): " CREATE_BOOT
if [[ "$CREATE_BOOT" == "y" ]]; then
  read -p "Boot partition size (default 2G): " BOOT_SIZE
  BOOT_SIZE=${BOOT_SIZE:-2G}
fi

read -p "Do you want to create a data partition (8309)? (y/N): " CREATE_DATA
if [[ "$CREATE_DATA" == "y" ]]; then
  read -p "Data partition size (leave blank to use all remaining space): " DATA_SIZE
fi

if [[ "$WIPE" == "y" ]]; then
  echo -e "o\ny\nw\ny" | gdisk "$DEVICE_PATH"
fi

read -p "Enter the initial partition number (default 1): " PART_NUM
PART_NUM=${PART_NUM:-1}

declare -A PARTITIONS
GPT_CMDS=""

if [[ "$CREATE_BOOT" == "y" ]]; then
  GPT_CMDS+="n\n$PART_NUM\n\n+$BOOT_SIZE\nEF00\n"
  PARTITIONS[boot]=$(get_partition_name "$DEVICE" "$PART_NUM")
  ((PART_NUM++))
fi

if [[ "$CREATE_DATA" == "y" ]]; then
  GPT_CMDS+="n\n$PART_NUM\n\n"
  if [[ -n "$DATA_SIZE" ]]; then
    GPT_CMDS+="+$DATA_SIZE\n"
  else
    GPT_CMDS+="\n"
  fi
  GPT_CMDS+="8309\n"
  PARTITIONS[data]=$(get_partition_name "$DEVICE" "$PART_NUM")
fi

if [[ -n "$GPT_CMDS" ]]; then
  echo -e "${GPT_CMDS}w\ny" | gdisk "$DEVICE_PATH"
fi

modprobe dm-crypt
modprobe dm-mod

if [[ -z "${PARTITIONS[boot]}" && "$CREATE_BOOT" != "y" ]]; then
  read -p "Enter the Boot partition name (e.g., sda1): " BOOT_PART
  PARTITIONS[boot]="/dev/$BOOT_PART"
fi

if [[ -z "${PARTITIONS[data]}" && "$CREATE_DATA" != "y" ]]; then
  read -p "Enter the data partition name (e.g., sda2): " DATA_PART
  PARTITIONS[data]="/dev/$DATA_PART"
fi

[[ "$CREATE_BOOT" == "y" ]] && mkfs.fat -F32 "${PARTITIONS[boot]}"
if [[ "$CREATE_DATA" == "y" ]]; then
  echo "You will now set a password for the encrypted data partition."
  cryptsetup luksFormat -v -s 512 -h sha512 "${PARTITIONS[data]}"
fi

if [[ "$CREATE_DATA" == "y" ]]; then
  echo "Please enter the password to unlock the encrypted data partition:"
  cryptsetup open --type luks "${PARTITIONS[data]}" lvm
fi

ls /dev/mapper/lvm
pvcreate /dev/mapper/lvm
vgcreate volgroup /dev/mapper/lvm

read -p "Root logical volume size (in GB, e.g., 40G): " ROOT_SIZE
read -p "Home logical volume size (e.g., 100%FREE or 20G): " HOME_SIZE

lvcreate -L "$ROOT_SIZE" volgroup -n root

if [[ "$HOME_SIZE" == *%* ]]; then
  lvcreate -l "$HOME_SIZE" volgroup -n home
else
  lvcreate -L "$HOME_SIZE" volgroup -n home
fi

vgscan
vgchange -ay

mkfs.ext4 /dev/volgroup/root
mkfs.ext4 /dev/volgroup/home

mount /dev/volgroup/root /mnt
mount --mkdir /dev/volgroup/home /mnt/home
mount --mkdir "${PARTITIONS[boot]}" /mnt/boot

pacstrap -K /mnt base linux linux-firmware
genfstab -U -p /mnt >> /mnt/etc/fstab

BOOT_DISK=$(lsblk -no pkname "${PARTITIONS[boot]}")

efibootmgr --create --disk "/dev/$BOOT_DISK" --part $((PART_NUM - 1)) --label "Arch Linux" --loader '\EFI\systemd\systemd-bootx64.efi'

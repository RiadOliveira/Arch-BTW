#!/bin/bash
set -e

timedatectl
sudo timedatectl set-timezone America/Recife
sudo timedatectl set-ntp true

read -p "Enter the device name for installation (e.g., sda, nvme0n1): " DEVICE
DEVICE_PATH="/dev/$DEVICE"

read -p "Do you want to delete all partitions and wipe the partition table? (y/N): " WIPE
read -p "Do you want to create an EFI partition (ef00)? (y/N): " CREATE_EFI
if [[ "$CREATE_EFI" == "y" ]]; then
  read -p "EFI partition size (default 1G): " EFI_SIZE
  EFI_SIZE=${EFI_SIZE:-1G}
fi

read -p "Do you want to create a Boot partition (ef02)? (y/N): " CREATE_BOOT
if [[ "$CREATE_BOOT" == "y" ]]; then
  read -p "Boot partition size (default 2G): " BOOT_SIZE
  BOOT_SIZE=${BOOT_SIZE:-2G}
fi

read -p "Do you want to create a data partition (8309)? (y/N): " CREATE_DATA
if [[ "$CREATE_DATA" == "y" ]]; then
  while [[ -z "$DATA_SIZE" ]]; do
    read -p "Data partition size (required): " DATA_SIZE
  done
fi

if [[ "$WIPE" == "y" ]]; then
  echo -e "o\ny\nw\ny" | gdisk "$DEVICE_PATH"
fi

PART_NUM=1
declare -A PARTITIONS

if [[ "$CREATE_EFI" == "y" ]]; then
  echo -e "n\n$PART_NUM\n\n+$EFI_SIZE\nEF00\nw\ny" | gdisk "$DEVICE_PATH"
  PARTITIONS[efi]="${DEVICE_PATH}${PART_NUM}"
  ((PART_NUM++))
fi

if [[ "$CREATE_BOOT" == "y" ]]; then
  echo -e "n\n$PART_NUM\n\n+$BOOT_SIZE\nEF02\nw\ny" | gdisk "$DEVICE_PATH"
  PARTITIONS[boot]="${DEVICE_PATH}${PART_NUM}"
  ((PART_NUM++))
fi

if [[ "$CREATE_DATA" == "y" ]]; then
  echo -e "n\n$PART_NUM\n\n+$DATA_SIZE\n8309\nw\ny" | gdisk "$DEVICE_PATH"
  PARTITIONS[data]="${DEVICE_PATH}${PART_NUM}"
  ((PART_NUM++))
fi

modprobe dm-crypt
modprobe dm-mod

if [[ -z "${PARTITIONS[efi]}" ]]; then
  read -p "Enter the EFI partition name (e.g., sda1): " EFI_PART
  PARTITIONS[efi]="/dev/$EFI_PART"
fi

if [[ -z "${PARTITIONS[boot]}" ]]; then
  read -p "Enter the Boot partition name (e.g., sda2): " BOOT_PART
  PARTITIONS[boot]="/dev/$BOOT_PART"
fi

if [[ -z "${PARTITIONS[data]}" ]]; then
  read -p "Enter the data partition name (e.g., sda3): " DATA_PART
  PARTITIONS[data]="/dev/$DATA_PART"
fi

[[ "$CREATE_EFI" == "y" ]] && mkfs.fat -F32 "${PARTITIONS[efi]}"
[[ "$CREATE_BOOT" == "y" ]] && mkfs.ext4 "${PARTITIONS[boot]}"
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
mount --mkdir "${PARTITIONS[efi]}" /mnt/efi
mount --mkdir "${PARTITIONS[boot]}" /mnt/boot

pacstrap -K /mnt base linux linux-firmware
genfstab -U -p /mnt >> /mnt/etc/fstab

EFI_DISK=$(lsblk -no pkname "${PARTITIONS[efi]}")

efibootmgr --create --disk "/dev/$EFI_DISK" --part 1 --label "KeyTool" --loader '\KeyTool.efi'

efibootmgr --create --disk "/dev/$EFI_DISK" --part 1 --label "Arch Linux" --loader '\systemd\systemd-bootx64.efi'

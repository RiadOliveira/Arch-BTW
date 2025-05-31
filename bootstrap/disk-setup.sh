#!/bin/bash
set -e

timedatectl
sudo timedatectl set-timezone America/Recife
sudo timedatectl set-ntp true

read -p "Digite o nome do dispositivo para a instalação (ex: sda, nvme0n1): " DEVICE
DEVICE_PATH="/dev/$DEVICE"

read -p "Deseja excluir todas as partições e limpar a tabela de partições? (s/N): " WIPE
read -p "Deseja criar uma partição EFI (ef00)? (s/N): " CREATE_EFI
if [[ "$CREATE_EFI" == "s" ]]; then
  read -p "Tamanho da partição EFI (padrão 1G): " EFI_SIZE
  EFI_SIZE=${EFI_SIZE:-1G}
fi

read -p "Deseja criar uma partição Boot (ef02)? (s/N): " CREATE_BOOT
if [[ "$CREATE_BOOT" == "s" ]]; then
  read -p "Tamanho da partição Boot (padrão 2G): " BOOT_SIZE
  BOOT_SIZE=${BOOT_SIZE:-2G}
fi

read -p "Deseja criar uma partição de dados (8309)? (s/N): " CREATE_DATA
if [[ "$CREATE_DATA" == "s" ]]; then
  while [[ -z "$DATA_SIZE" ]]; do
    read -p "Tamanho da partição de dados (obrigatório): " DATA_SIZE
  done
fi

if [[ "$WIPE" == "s" ]]; then
  echo -e "o\ny\nw\ny" | gdisk "$DEVICE_PATH"
fi

PART_NUM=1
declare -A PARTITIONS

if [[ "$CREATE_EFI" == "s" ]]; then
  echo -e "n\n$PART_NUM\n\n+$EFI_SIZE\nEF00\nw\ny" | gdisk "$DEVICE_PATH"
  PARTITIONS[efi]="${DEVICE_PATH}${PART_NUM}"
  ((PART_NUM++))
fi

if [[ "$CREATE_BOOT" == "s" ]]; then
  echo -e "n\n$PART_NUM\n\n+$BOOT_SIZE\nEF02\nw\ny" | gdisk "$DEVICE_PATH"
  PARTITIONS[boot]="${DEVICE_PATH}${PART_NUM}"
  ((PART_NUM++))
fi

if [[ "$CREATE_DATA" == "s" ]]; then
  echo -e "n\n$PART_NUM\n\n+$DATA_SIZE\n8309\nw\ny" | gdisk "$DEVICE_PATH"
  PARTITIONS[data]="${DEVICE_PATH}${PART_NUM}"
  ((PART_NUM++))
fi

modprobe dm-crypt
modprobe dm-mod

if [[ -z "${PARTITIONS[efi]}" ]]; then
  read -p "Digite o nome da partição EFI (ex: sda1): " EFI_PART
  PARTITIONS[efi]="/dev/$EFI_PART"
fi

if [[ -z "${PARTITIONS[boot]}" ]]; then
  read -p "Digite o nome da partição Boot (ex: sda2): " BOOT_PART
  PARTITIONS[boot]="/dev/$BOOT_PART"
fi

if [[ -z "${PARTITIONS[data]}" ]]; then
  read -p "Digite o nome da partição de dados (ex: sda3): " DATA_PART
  PARTITIONS[data]="/dev/$DATA_PART"
fi

[[ "$CREATE_EFI" == "s" ]] && mkfs.fat -F32 "${PARTITIONS[efi]}"
[[ "$CREATE_BOOT" == "s" ]] && mkfs.ext4 "${PARTITIONS[boot]}"
if [[ "$CREATE_DATA" == "s" ]]; then
  echo "You will now set a password for the encrypted data partition."
  cryptsetup luksFormat -v -s 512 -h sha512 "${PARTITIONS[data]}"
fi

if [[ "$CREATE_DATA" == "s" ]]; then
  echo "Please enter the password to unlock the encrypted data partition:"
  cryptsetup open --type luks "${PARTITIONS[data]}" lvm
fi

ls /dev/mapper/lvm
pvcreate /dev/mapper/lvm
vgcreate volgroup /dev/mapper/lvm

read -p "Tamanho do volume lógico root (em GB, ex: 30G): " ROOT_SIZE
read -p "Tamanho do volume lógico home (ex: 100%FREE ou 20G): " HOME_SIZE

lvcreate -L "$ROOT_SIZE" volgroup -n root
lvcreate -L "$HOME_SIZE" volgroup -n home

vgscan
vgchange -ay

mkfs.ext4 /dev/volgroup/root
mkfs.ext4 /dev/volgroup/home

mount /dev/volgroup/root /mnt
mount --mkdir /dev/volgroup/home /mnt/home
mount --mkdir "${PARTITIONS[boot]}" /mnt/boot
mount --mkdir "${PARTITIONS[efi]}" /mnt/boot/efi

pacstrap -K /mnt base linux linux-firmware
genfstab -U -p /mnt >> /mnt/etc/fstab

EFI_DISK=$(lsblk -no pkname "${PARTITIONS[efi]}")

efibootmgr --create --disk "/dev/$EFI_DISK" --part 1 --label "Arch Linux" --loader '\systemd\systemd-bootx64.efi'

efibootmgr --create --disk "/dev/$EFI_DISK" --part 1 --label "KeyTool" --loader '\KeyTool.efi'

#!/bin/bash
set -e

# ───────────────────────────────────────────────
# ▶ BOOTLOADER CONFIGURATION
# ───────────────────────────────────────────────

bootctl install

# Replace UUID placeholder in arch.conf with actual UUID of data partition
ARCH_CONF="/boot/loader/entries/arch.conf"
DATA_UUID_PLACEHOLDER="DATA_UUID"

# Attempt to get the UUID from known path, else prompt
if grep -q "$DATA_UUID_PLACEHOLDER" "$ARCH_CONF"; then
  read -p "Enter the name of the data partition (e.g., sda3, nvme0n1p3): " DATA_PART_NAME
  DATA_UUID=$(blkid -s UUID -o value "/dev/$DATA_PART_NAME")
  if [ -z "$DATA_UUID" ]; then
    echo "Failed to get UUID from /dev/$DATA_PART_NAME"
    exit 1
  fi
  sed -i "s/$DATA_UUID_PLACEHOLDER/$DATA_UUID/" "$ARCH_CONF"
fi

# ───────────────────────────────────────────────
# ▶ SECURE BOOT CONFIGURATION
# ───────────────────────────────────────────────

sudo mkdir -p /etc/secureboot/keys
cd /etc/secureboot/keys

uuidgen --random > GUID.txt

sudo openssl req -newkey rsa:2048 -nodes -keyout PK.key -new -x509 -sha256 -days 3650 -subj "/CN=Platform Key/" -out PK.crt
sudo openssl req -newkey rsa:2048 -nodes -keyout KEK.key -new -x509 -sha256 -days 3650 -subj "/CN=KEK Key/" -out KEK.crt
sudo openssl req -newkey rsa:2048 -nodes -keyout db.key  -new -x509 -sha256 -days 3650 -subj "/CN=db Key/"  -out db.crt

sudo chmod 600 *.key

cert-to-efi-sig-list -g "$(< GUID.txt)" PK.crt PK.esl
sign-efi-sig-list   -g "$(< GUID.txt)" -k PK.key  -c PK.crt  PK  PK.esl  PK.auth

cert-to-efi-sig-list -g "$(< GUID.txt)" KEK.crt KEK.esl
sign-efi-sig-list   -g "$(< GUID.txt)" -k PK.key  -c PK.crt  KEK KEK.esl KEK.auth

cert-to-efi-sig-list -g "$(< GUID.txt)" db.crt db.esl
sign-efi-sig-list   -g "$(< GUID.txt)" -k KEK.key -c KEK.crt db  db.esl  db.auth

sudo sbsign --key db.key --cert db.crt --output /efi/EFI/systemd/systemd-bootx64.efi /efi/EFI/systemd/systemd-bootx64.efi
sudo sbsign --key db.key --cert db.crt --output /boot/vmlinuz-linux /boot/vmlinuz-linux

sudo cp /usr/share/efitools/efi/KeyTool.efi /efi/EFI/
sudo mkdir -p /efi/EFI/keys
sudo cp /etc/secureboot/keys/*.auth /efi/EFI/keys/
sudo cp /etc/secureboot/keys/*.esl /efi/EFI/keys/

# ───────────────────────────────────────────────
# ▶ REFLECTOR BACKUP
# ───────────────────────────────────────────────

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

# ───────────────────────────────────────────────
# ▶ UFW FIREWALL CONFIGURATION
# ───────────────────────────────────────────────

sudo ufw default deny incoming
sudo ufw default allow outgoing

# ───────────────────────────────────────────────
# ▶ POWER MANAGEMENT
# ───────────────────────────────────────────────

sudo x86_energy_perf_policy performance

sudo chmod +x /usr/local/bin/set-power-profile.sh

read -p "Do you want to apply hdparm performance tuning? (y/N): " APPLY_HDPARM
if [[ "$APPLY_HDPARM" == "y" || "$APPLY_HDPARM" == "Y" ]]; then
  read -p "Enter the device name (e.g., sda, nvme0n1): " HDPARM_DEVICE
  sudo hdparm -B 255 "/dev/$HDPARM_DEVICE"
fi

# ───────────────────────────────────────────────
# ▶ SOUND CONFIGURATION
# ───────────────────────────────────────────────

amixer -c 0 sset "Auto-Mute Mode" Disabled
sudo alsactl store

# ───────────────────────────────────────────────
# ▶ MPV CONFIGURATION
# ───────────────────────────────────────────────

cp -r /usr/share/doc/mpv/ "/home/$NEW_USER/.config/"
chown -R "$NEW_USER":"$NEW_USER" "/home/$NEW_USER/.config/mpv"

# ───────────────────────────────────────────────
# ▶ USER CONFIGURATION
# ───────────────────────────────────────────────

# Set hostname
read -p "Enter the hostname for this machine: " HOSTNAME
echo "$HOSTNAME" > /etc/hostname

# Add user to sudoers
sed -i "s/^user-name ALL=(ALL) ALL/$NEW_USER ALL=(ALL) ALL/" /etc/sudoers

# Set timezone and hardware clock
ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime
hwclock --systohc

# Generate locales
locale-gen

# ───────────────────────────────────────────────
# ▶ AUXILIARY FOLDERS
# ───────────────────────────────────────────────

mkdir -p "/home/$NEW_USER/Screenshots"
mkdir -p "/home/$NEW_USER/Downloads/Bluetooth"
chown -R "$NEW_USER":"$NEW_USER" "/home/$NEW_USER/Screenshots"
chown -R "$NEW_USER":"$NEW_USER" "/home/$NEW_USER/Downloads"

# ───────────────────────────────────────────────
# ▶ GIT CONFIGURATION
# ───────────────────────────────────────────────

read -p "Enter Git user name: " GIT_USER_NAME
read -p "Enter Git email: " GIT_USER_EMAIL

git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global init.defaultBranch main

# ───────────────────────────────────────────────
# ▶ INITRAMFS HOOKS AND MODULES
# ───────────────────────────────────────────────

mkinitcpio -p linux

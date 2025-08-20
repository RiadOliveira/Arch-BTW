#!/bin/bash

CONFIG_DIR="$(dirname "$(realpath "$0")")/../config"

convert_path() {
  local folder_path="$1"
  local system_path=""
  
  system_path="/${folder_path//;/\/}"
  system_path="${system_path//\/home\/user\//\/home\/$NEW_USER\/}"
  
  echo "$system_path"
}

deploy_configs() {
  find "$CONFIG_DIR" -type f | while read -r file; do
    local relative_path="${file#$CONFIG_DIR/}"
    
    local directory_path=$(dirname "$relative_path")
    local filename=$(basename "$file")
    local system_path=$(convert_path "$directory_path")

    mkdir -p "$system_path"
    cp "$file" "$system_path/$filename"
  done
}

deploy_configs

chown -R $NEW_USER:$NEW_USER /home/$NEW_USER
chmod -R u=rwX,go=rX /home/$NEW_USER

# ───────────────────────────────────────────────
# ▶ BOOT CONFIGURATION
# ───────────────────────────────────────────────

ARCH_CONF="/boot/loader/entries/arch.conf"
DATA_UUID_PLACEHOLDER="DATA_UUID"

if grep -q "$DATA_UUID_PLACEHOLDER" "$ARCH_CONF"; then
  DATA_UUID=$(blkid -s UUID -o value "/dev/$DATA_PART_NAME")
  sed -i "s/$DATA_UUID_PLACEHOLDER/$DATA_UUID/" "$ARCH_CONF"
fi

# ───────────────────────────────────────────────
# ▶ FSTAB PERMISSIONS
# ───────────────────────────────────────────────

sed -i -E 's/fmask=[0-9]+,dmask=[0-9]+/fmask=0077,dmask=0077/g' /etc/fstab

# ───────────────────────────────────────────────
# ▶ USER CONFIGURATION
# ───────────────────────────────────────────────

echo "$HOSTNAME" > /etc/hostname

# Add user to sudoers
sed -i "s/^user-name ALL=(ALL) ALL/$NEW_USER ALL=(ALL) ALL/" /etc/sudoers

# Change Docker data-root to user home path
sed -i "s|\"data-root\": \"/home/.*/\.docker-data\"|\"data-root\": \"/home/$NEW_USER/.docker-data\"|" /etc/docker/daemon.json

# Set timezone and hardware clock
timedatectl set-timezone America/Recife
ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime

timedatectl set-ntp true
hwclock --systohc

locale-gen

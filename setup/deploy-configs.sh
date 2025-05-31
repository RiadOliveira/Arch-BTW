#!/bin/bash
set -e

CONFIG_DIR="$(dirname "$(realpath "$0")")/../config"

copy_to_target() {
  local source_path="$1"
  local target_path="$2"

  mkdir -p "$(dirname "$target_path")"
  cp -r "$source_path" "$target_path"
}

# ───────────────────────────────────────────────
# ▶ USER CONFIGURATION
# ───────────────────────────────────────────────

# Set root password
echo "Set root password:"
passwd

# Create a new user and set password
read -p "Enter the new username: " NEW_USER
useradd -m -g users -G wheel,video "$NEW_USER"
echo "Set password for user $NEW_USER:"
passwd "$NEW_USER"

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
# ▶ DEPLOY CONFIGS
# ───────────────────────────────────────────────

# Walk through all files and directories in CONFIG_DIR
find "$CONFIG_DIR" -mindepth 1 | while read -r full_source_path; do
  relative_path="${full_source_path#$CONFIG_DIR/}"
  decoded_path=$(echo "$relative_path" | sed 's/;/\//g')

  # Handle home path for NEW_USER only
  if [[ "$decoded_path" == home/"$NEW_USER"/* ]]; then
    target="/$decoded_path"
    copy_to_target "$full_source_path" "$target"
    chown -R "$NEW_USER:$NEW_USER" "/home/$NEW_USER"
  elif [[ "$decoded_path" != home/* ]]; then
    # System-wide configs
    target="/$decoded_path"
    copy_to_target "$full_source_path" "$target"
  fi
done

#!/bin/bash
set -e

# ───────────────────────────────────────────────
# ▶ USER CONFIGURATION
# ───────────────────────────────────────────────

# Set root password
echo "Set root password:"
passwd

# Create a new user and set password
read -p "Enter the new username: " NEW_USER

useradd -m -G wheel,video "$NEW_USER"
echo "Set password for user $NEW_USER:"
passwd "$NEW_USER"

read -p "Enter the hostname for this machine: " HOSTNAME

read -p "Enter Git user name: " GIT_USER_NAME
read -p "Enter Git email: " GIT_USER_EMAIL

read -p "Enter the name of the data partition (e.g., sda2, nvme0n1p2): " DATA_PART_NAME

read -p "Do you want to apply hdparm performance tuning? (y/N): " APPLY_HDPARM
if [[ "$APPLY_HDPARM" == "y" || "$APPLY_HDPARM" == "Y" ]]; then
  read -p "Enter the device name (e.g., sda, nvme0n1): " HDPARM_DEVICE
  export HDPARM_DEVICE
fi

export NEW_USER HOSTNAME GIT_USER_NAME GIT_USER_EMAIL DATA_PART_NAME APPLY_HDPARM

# ───────────────────────────────────────────────
# ▶ INSTALLATION SCRIPTS
# ───────────────────────────────────────────────

pacman -S --noconfirm --needed base-devel git

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

echo "▶️ Running: deploy-configs.sh"
bash "$SCRIPT_DIR/deploy-configs.sh"

# Add user to sudoers
sed -i "s/^user-name ALL=(ALL) ALL/$NEW_USER ALL=(ALL) ALL/" /etc/sudoers

echo "▶️ Running: install-packages.sh"
bash "$SCRIPT_DIR/install-packages.sh"

echo "▶️ Running: enable-services.sh"
bash "$SCRIPT_DIR/enable-services.sh"

echo "▶️ Running: final-setup.sh"
bash "$SCRIPT_DIR/final-setup.sh"

echo "✅ Installation completed successfully."

#!/bin/bash

# ───────────────────────────────────────────────
# ▶ DATA READING
# ───────────────────────────────────────────────

echo "Set root password:"
passwd

read -p "Enter the new username: " NEW_USER
useradd -m -G wheel,video "$NEW_USER"

echo "Set password for user $NEW_USER:"
passwd "$NEW_USER"

read -p "Enter the hostname for this machine: " HOSTNAME

read -p "Enter the name of the data partition (e.g., sda2, nvme0n1p2): " DATA_PART_NAME

export NEW_USER HOSTNAME DATA_PART_NAME

# ───────────────────────────────────────────────
# ▶ INSTALLATION SCRIPTS
# ───────────────────────────────────────────────

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

bootctl install

echo "▶️ Running: deploy-configs.sh"
bash "$SCRIPT_DIR/deploy-configs.sh"

echo "▶️ Running: install-base-packages.sh"
bash "$SCRIPT_DIR/install-base-packages.sh"

echo "▶️ Running: enable-base-services.sh"
bash "$SCRIPT_DIR/enable-base-services.sh"

echo "✅ Installation completed successfully."

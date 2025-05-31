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
export NEW_USER

useradd -m -g users -G wheel,video "$NEW_USER"
echo "Set password for user $NEW_USER:"
passwd "$NEW_USER"

# ───────────────────────────────────────────────
# ▶ INSTALLATION SCRIPTS
# ───────────────────────────────────────────────

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

echo "▶️ Running: install-packages.sh"
bash "$SCRIPT_DIR/install-packages.sh"

echo "▶️ Running: deploy-configs.sh"
bash "$SCRIPT_DIR/deploy-configs.sh"

echo "▶️ Running: enable-services.sh"
bash "$SCRIPT_DIR/enable-services.sh"

echo "▶️ Running: final-setup.sh"
bash "$SCRIPT_DIR/final-setup.sh"

echo "✅ Installation completed successfully."

#!/bin/bash

# ───────────────────────────────────────────────
# ▶ DATA READING
# ───────────────────────────────────────────────

read -p "Enter Git user name: " GIT_USER_NAME
read -p "Enter Git email: " GIT_USER_EMAIL

export GIT_USER_NAME GIT_USER_EMAIL

# ───────────────────────────────────────────────
# ▶ INSTALLATION SCRIPTS
# ───────────────────────────────────────────────

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

echo "▶️ Running: install-packages.sh"
bash "$SCRIPT_DIR/install-packages.sh"

echo "▶️ Running: enable-services.sh"
bash "$SCRIPT_DIR/enable-services.sh"

echo "▶️ Running: set-configs.sh"
bash "$SCRIPT_DIR/set-configs.sh"

echo "Post-Installation completed successfully."
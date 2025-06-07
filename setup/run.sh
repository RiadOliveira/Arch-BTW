#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

echo "▶️ Running: read-data.sh"
bash "$SCRIPT_DIR/read-data.sh"

echo "▶️ Running: install-base-packages.sh"
bash "$SCRIPT_DIR/install-base-packages.sh"

echo "▶️ Running: deploy-configs.sh"
bash "$SCRIPT_DIR/deploy-configs.sh"

echo "▶️ Running: setup-bootloader.sh"
bash "$SCRIPT_DIR/setup-bootloader.sh"

echo "✅ Installation completed successfully."

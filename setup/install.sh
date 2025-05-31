#!/bin/bash
set -e

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

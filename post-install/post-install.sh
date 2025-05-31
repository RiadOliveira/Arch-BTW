#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

echo "▶️ Running: enable-user-services.sh"
bash "$SCRIPT_DIR/enable-user-services.sh"

echo "▶️ Running: install-yay-packages.sh"
bash "$SCRIPT_DIR/install-yay-packages.sh"

echo "✅ Post-Installation completed successfully."

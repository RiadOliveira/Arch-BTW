#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

echo "▶️ Running: install-packages.sh"
bash "$SCRIPT_DIR/install-packages.sh"

echo "▶️ Running: enable-services.sh"
bash "$SCRIPT_DIR/enable-services.sh"

echo "▶️ Running: set-configs.sh"
bash "$SCRIPT_DIR/set-configs.sh"

echo "✅ Post-Installation completed successfully."
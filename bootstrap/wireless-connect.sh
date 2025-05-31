#!/bin/bash
set -e

# ───────────────────────────────────────────────
# ▶ IWCTL Wi-Fi SETUP
# ───────────────────────────────────────────────

# Start iwctl and get the first wireless device name
echo "Detecting wireless devices..."
DEVICE_NAME=$(iwctl device list | awk '/station/ {print $1; exit}')

if [ -z "$DEVICE_NAME" ]; then
  echo "No wireless device found. Aborting."
  exit 1
fi

echo "Using wireless device: $DEVICE_NAME"

# Scan for available networks
iwctl station "$DEVICE_NAME" scan
sleep 2
iwctl station "$DEVICE_NAME" get-networks

# Ask user for SSID and password
read -p "Enter the Wi-Fi SSID you want to connect to: " SSID
read -s -p "Enter the Wi-Fi password: " PASSPHRASE
echo

# Try to connect in a loop until successful
while true; do
  echo "Attempting to connect to $SSID..."
  if iwctl --passphrase "$PASSPHRASE" station "$DEVICE_NAME" connect "$SSID"; then
    echo "✅ Successfully connected to $SSID!"
    break
  else
    echo "❌ Failed to connect. Please check the credentials and try again."
    read -p "Enter the Wi-Fi SSID again: " SSID
    read -s -p "Enter the Wi-Fi password again: " PASSPHRASE
    echo
  fi
done
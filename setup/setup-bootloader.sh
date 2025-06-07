#!/bin/bash
set -e

bootctl install

# Replace UUID placeholder in arch.conf with actual UUID of data partition
ARCH_CONF="/boot/loader/entries/arch.conf"
DATA_UUID_PLACEHOLDER="DATA_UUID"

# Attempt to get the UUID from known path, else prompt
if grep -q "$DATA_UUID_PLACEHOLDER" "$ARCH_CONF"; then
  DATA_UUID=$(blkid -s UUID -o value "/dev/$DATA_PART_NAME")

  if [ -z "$DATA_UUID" ]; then
    echo "Failed to get UUID from /dev/$DATA_PART_NAME"
    exit 1
  fi

  sed -i "s/$DATA_UUID_PLACEHOLDER/$DATA_UUID/" "$ARCH_CONF"
fi

mkinitcpio -p linux

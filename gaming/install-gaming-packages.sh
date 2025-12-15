#!/bin/bash

GAMING_PACKAGES_FILE="$(dirname "$(realpath "$0")")/gaming-packages.txt"
gaming_packages=$(grep -vE '^\s*#|^\s*$' "$GAMING_PACKAGES_FILE")

echo "Installing the following gaming packages:"
echo "$gaming_packages"
echo

yay -Sy --noconfirm --needed $gaming_packages
yay -Syu --noconfirm

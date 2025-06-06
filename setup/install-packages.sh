#!/bin/bash
set -e

PACKAGE_FILE="$(dirname "$(realpath "$0")")/../packages.txt"
packages=$(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE")

echo "Installing the following packages:"
echo "$packages"
echo

pacman -S --noconfirm --needed $packages
pacman -Syu --noconfirm

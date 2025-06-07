#!/bin/bash
set -e

BASE_PACKAGE_FILE="$(dirname "$(realpath "$0")")/base-packages.txt"
base_packages=$(grep -vE '^\s*#|^\s*$' "$BASE_PACKAGE_FILE")

echo "Installing the following base packages:"
echo "$base_packages"
echo

pacman -S --noconfirm --needed $base_packages
pacman -Syu --noconfirm

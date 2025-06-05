#!/bin/bash
set -e

PACKAGE_FILE="$(dirname "$(realpath "$0")")/../packages.txt"
packages=$(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE")

su - "$NEW_USER" <<'EOF'
set -e

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sirc --noconfirm

cd ..
rm -rf yay

echo "Installing the following packages:"
echo "$packages"
echo

yay -S --noconfirm --needed $packages
yay -Syu --noconfirm
EOF

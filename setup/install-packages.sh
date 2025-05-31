#!/bin/bash
set -e

PACKAGE_FILE="$(dirname "$(realpath "$0")")/../packages.txt"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sirc

cd ..
rm -rf yay

packages=$(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE")

echo "Installing the following packages:"
echo "$packages"
echo

yay -S --noconfirm --needed $packages
yay -Syu --noconfirm
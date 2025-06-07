#!/bin/bash

PACKAGE_FILE="$(dirname "$(realpath "$0")")/packages.txt"
packages=$(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE")

git clone https://aur.archlinux.org/yay.git

cd yay
makepkg -sirc

cd ..
rm -rf yay

echo "Installing the following packages:"
echo "$packages"
echo

yay -S --noconfirm --needed $packages
yay -Syu --noconfirm
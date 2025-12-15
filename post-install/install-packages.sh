#!/bin/bash

PACKAGES_FILE="$(dirname "$(realpath "$0")")/packages.txt"
packages=$(grep -vE '^\s*#|^\s*$' "$PACKAGES_FILE")

git clone https://aur.archlinux.org/yay.git

cd yay
makepkg -sirc --noconfirm

cd ..
rm -rf yay

echo "Installing the following packages:"
echo "$packages"
echo

yay -Sy --noconfirm --needed $packages
yay -Syu --noconfirm

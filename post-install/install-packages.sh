#!/bin/bash

PACKAGE_FILE="$(dirname "$(realpath "$0")")/packages.txt"
packages=$(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE")

git clone https://aur.archlinux.org/paru.git

cd paru
makepkg -sirc --noconfirm

cd ..
rm -rf paru

echo "Installing the following packages:"
echo "$packages"
echo

paru -S --noconfirm --needed $packages
paru -Syu --noconfirm
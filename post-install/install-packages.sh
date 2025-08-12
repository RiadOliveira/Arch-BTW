#!/bin/bash

PACKAGES_FILE="$(dirname "$(realpath "$0")")/packages.txt"
packages=$(grep -vE '^\s*#|^\s*$' "$PACKAGES_FILE")

git clone https://aur.archlinux.org/paru.git

cd paru
makepkg -sirc --noconfirm

cd ..
rm -rf paru

echo "Installing the following packages:"
echo "$packages"
echo

paru -Sy --noconfirm --needed $packages
paru -Syu --noconfirm

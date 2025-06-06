#!/bin/bash
set -e

AUR_PACKAGE_FILE="$(dirname "$(realpath "$0")")/../aur-packages.txt"
aur_packages=$(grep -vE '^\s*#|^\s*$' "$AUR_PACKAGE_FILE")

git clone https://aur.archlinux.org/yay.git

cd yay
makepkg -sirc

cd ..
rm -rf yay

echo "Installing the following AUR packages:"
echo "$aur_packages"
echo

yay -S --noconfirm --needed $aur_packages
yay -Syu --noconfirm
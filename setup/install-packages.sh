#!/bin/bash
set -e

PACKAGE_FILE="$(dirname "$(realpath "$0")")/../packages.txt"
AUR_PACKAGE_FILE="$(dirname "$(realpath "$0")")/../aur-packages.txt"

packages=$(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE")
aur_packages=$(grep -vE '^\s*#|^\s*$' "$AUR_PACKAGE_FILE")

echo "Installing the following packages:"
echo "$packages"
echo

pacman -S --noconfirm --needed $packages
pacman -Syu --noconfirm

# Add user to sudoers
sed -i "s/^user-name ALL=(ALL) ALL/$NEW_USER ALL=(ALL) ALL/" /etc/sudoers

sudo -u "$NEW_USER" bash <<EOF
  set -e
  cd ~

  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -sirc --noconfirm

  cd ..
  rm -rf yay

  echo "Installing the following AUR packages:"
  echo "$aur_packages"
  echo

  yay -S --noconfirm --needed $aur_packages
  yay -Syu --noconfirm
EOF

cd /
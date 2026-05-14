#!/bin/bash

PACKAGES_FILE="$(dirname "$(realpath "$0")")/packages.txt"
packages=$(cmd grep -vE '^\s*#|^\s*$' "$PACKAGES_FILE")

yay -Sy --noconfirm --needed $packages
yay -Syu --noconfirm

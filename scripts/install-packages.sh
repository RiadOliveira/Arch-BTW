#!/bin/bash

PACKAGE_FILE="$(dirname "$(realpath "$0")")/../packages.txt"

if ! command -v yay &>/dev/null; then
  echo "yay not installed. Install it first!"
  exit 1
fi

packages=$(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE")

echo "Installing the following packages:"
echo "$packages"
echo

yay -S --needed $packages
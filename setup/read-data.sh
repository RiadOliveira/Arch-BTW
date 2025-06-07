#!/bin/bash
set -e

echo "Set root password:"
passwd

read -p "Enter the new username: " NEW_USER
useradd -m -G wheel,video "$NEW_USER"

echo "Set password for user $NEW_USER:"
passwd "$NEW_USER"

read -p "Enter the hostname for this machine: " HOSTNAME

read -p "Enter Git user name: " GIT_USER_NAME
read -p "Enter Git email: " GIT_USER_EMAIL

read -p "Enter the name of the data partition (e.g., sda2, nvme0n1p2): " DATA_PART_NAME

export NEW_USER HOSTNAME GIT_USER_NAME GIT_USER_EMAIL DATA_PART_NAME
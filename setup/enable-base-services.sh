#!/bin/bash

sudo systemctl enable systemd-networkd systemd-resolved iwd sshd dbus-broker nvidia-suspend nvidia-hibernate nvidia-resume

ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

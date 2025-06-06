#!/bin/bash
set -e

sudo systemctl enable sshd reflector.timer ufw systemd-networkd systemd-resolved iwd fstrim.timer tlp rtkit-daemon fail2ban haveged dbus-broker nvidia-suspend nvidia-hibernate nvidia-resume greetd

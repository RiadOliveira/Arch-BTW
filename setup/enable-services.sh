#!/bin/bash
set -e

sudo systemctl enable sshd NetworkManager reflector.timer ufw systemd-resolved fstrim.timer tlp rtkit-daemon fail2ban haveged dbus-broker nvidia-suspend nvidia-hibernate nvidia-resume greetd

sudo systemctl --user enable pipewire pipewire-pulse wireplumber udiskie
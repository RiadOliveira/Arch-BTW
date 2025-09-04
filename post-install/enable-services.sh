#!/bin/bash

sudo systemctl enable --now reflector.timer ufw fstrim.timer tlp rtkit-daemon fail2ban haveged sddm docker.socket preload gopreload

systemctl --user enable --now pipewire-pulse wireplumber gcr-ssh-agent.socket waybar battery-monitor.timer

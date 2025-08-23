#!/bin/bash

sudo systemctl enable reflector.timer ufw fstrim.timer tlp rtkit-daemon fail2ban haveged sddm docker.socket

systemctl --user enable --now pipewire-pulse wireplumber gcr-ssh-agent.socket waybar battery-monitor.timer

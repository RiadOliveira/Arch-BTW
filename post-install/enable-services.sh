#!/bin/bash

sudo systemctl enable reflector.timer ufw fstrim.timer tlp rtkit-daemon fail2ban haveged greetd

systemctl --user enable --now pipewire-pulse wireplumber gcr-ssh-agent.socket hyprpolkitagent waybar docker.socket

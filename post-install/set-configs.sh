#!/bin/bash

# ───────────────────────────────────────────────
# ▶ REFLECTOR BACKUP
# ───────────────────────────────────────────────

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

# ───────────────────────────────────────────────
# ▶ UFW FIREWALL CONFIGURATION
# ───────────────────────────────────────────────

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# ───────────────────────────────────────────────
# ▶ POWER MANAGEMENT
# ───────────────────────────────────────────────

sudo x86_energy_perf_policy performance

sudo chmod +x /usr/local/bin/set-power-profile.sh

read -p "Do you want to apply hdparm performance tuning? (y/N): " APPLY_HDPARM
if [[ "$APPLY_HDPARM" == "y" || "$APPLY_HDPARM" == "Y" ]]; then
  read -p "Enter the device name (e.g., sda, nvme0n1): " HDPARM_DEVICE
  sudo hdparm -B 255 "/dev/$HDPARM_DEVICE"
fi

# ───────────────────────────────────────────────
# ▶ MPV CONFIGURATION
# ───────────────────────────────────────────────

sudo cp -r /usr/share/doc/mpv/ "/home/$NEW_USER/.config/"
sudo chown -R "$NEW_USER:$NEW_USER" "/home/$NEW_USER/.config/mpv"

# ───────────────────────────────────────────────
# ▶ SOUND CONFIGURATION
# ───────────────────────────────────────────────

amixer sset Master unmute
sudo alsactl store

# ───────────────────────────────────────────────
# ▶ GIT CONFIGURATION
# ───────────────────────────────────────────────

git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global init.defaultBranch main

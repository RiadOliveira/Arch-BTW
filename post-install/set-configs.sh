#!/bin/bash

# ───────────────────────────────────────────────
# ▶ AUXILIARY FOLDERS
# ───────────────────────────────────────────────

mkdir -p ~/Documents ~/Projects ~/Screenshots ~/Downloads/Bluetooth

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
# ▶ SDDM CONFIGURATION
# ───────────────────────────────────────────────

sudo mv /usr/share/sddm/themes/sugar-candy/Main.bak /usr/share/sddm/themes/sugar-candy/Main.qml

# ───────────────────────────────────────────────
# ▶ MPV CONFIGURATION
# ───────────────────────────────────────────────

cp -r /usr/share/doc/mpv/ ~/.config/

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
git config --global core.editor nvim

# ───────────────────────────────────────────────
# ▶ GNOME KEYRING PERMISSION
# ───────────────────────────────────────────────

sudo setcap cap_ipc_lock=ep /usr/bin/gnome-keyring-daemon

# ───────────────────────────────────────────────
# ▶ TIMEZONE CONFIG
# ───────────────────────────────────────────────

sudo timedatectl set-ntp true
sudo hwclock --systohc

# ───────────────────────────────────────────────
# ▶ FISH CONFIG
# ───────────────────────────────────────────────

chsh -s /bin/fish
set -U fish_greeting
set -U fish_color_command '#ecb90f'
set -U fish_user_paths $HOME/.local/bin $fish_user_paths
set -U fish_user_paths $HOME/.local/share/nvim/mason/bin $fish_user_paths

# ───────────────────────────────────────────────
# ▶ DOCKER CONFIG
# ───────────────────────────────────────────────

sudo usermod -aG docker $USER

# Change Docker data-root to user home path
sudo sed -i "s|\"data-root\": \"/home/.*/\.docker-data\"|\"data-root\": \"/home/$USER/.docker-data\"|" /etc/docker/daemon.json

# ───────────────────────────────────────────────
# ▶ GAMING CONFIGS
# ───────────────────────────────────────────────

sudo usermod -aG games $USER
sed -i "s|/home/user-name|/home/$USER|g" ~/.config/heroic/config.json

# ───────────────────────────────────────────────
# ▶ ALLOW CUSTOM BINARIES
# ───────────────────────────────────────────────

chmod +x ~/.local/bin/*

# ───────────────────────────────────────────────
# ▶ BUILD BAT CACHE
# ───────────────────────────────────────────────

bat cache --build

# ───────────────────────────────────────────────
# ▶ DOWNLOAD TPM
# ───────────────────────────────────────────────

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
bash ~/.config/tmux/plugins/tpm/bin/install_plugins


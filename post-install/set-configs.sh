#!/bin/bash

# ───────────────────────────────────────────────
# ▶ AUXILIARY FOLDERS
# ───────────────────────────────────────────────

mkdir -p ~/Documents
mkdir -p ~/Projects
mkdir -p ~/Screenshots
mkdir -p ~/Downloads/Bluetooth

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
# ▶ SET FISH AS DEFAULT SHELL
# ───────────────────────────────────────────────

chsh -s /bin/fish

# ───────────────────────────────────────────────
# ▶ SET FISH VARIABLES
# ───────────────────────────────────────────────

set -U fish_greeting
set -U fish_color_command '#ecb90f'
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

# ───────────────────────────────────────────────
# ▶ GIVE DOCKER PERMISSION
# ───────────────────────────────────────────────

sudo usermod -aG docker $USER

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


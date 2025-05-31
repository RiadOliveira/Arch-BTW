#!/bin/bash
set -e

systemctl --user enable --now pipewire pipewire-pulse wireplumber udiskie

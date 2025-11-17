# Aliases
alias cmd='command'

alias pac-up='paru -Syu'
alias mirrors-up='systemctl start reflector'

alias pac-add='paru -S'
alias pac-info='paru -Qi'
alias pac-purge='paru -Rns'
alias pac-check='paru -Q'
alias pac-cache='yes | paru -Scc'
alias pac-clean='paru -Rns $(paru -Qdtq)'

alias browser="$APP_CMD zen-browser"
alias browser-bg="$APP_CMD nohup zen-browser $DISOWN_CMD"

alias zen-browser="$APP_CMD zen-browser"
alias zen-browser-bg="$APP_CMD nohup zen-browser $DISOWN_CMD"

alias vscode="$APP_CMD code . --password-store='gnome-libsecret' $ELECTRON_ARGS"
alias vscode-bg="$APP_CMD nohup code . --password-store='gnome-libsecret' $ELECTRON_ARGS $DISOWN_CMD"

alias discord="$APP_CMD discord $ELECTRON_ARGS"
alias discord-bg="$APP_CMD nohup discord $ELECTRON_ARGS $DISOWN_CMD"

alias obsidian="$APP_CMD obsidian $ELECTRON_ARGS"
alias obsidian-bg="$APP_CMD nohup obsidian $ELECTRON_ARGS $DISOWN_CMD"

alias beekeeper-studio="$APP_CMD beekeeper-studio $ELECTRON_ARGS"
alias beekeeper-studio-bg="$APP_CMD nohup beekeeper-studio $ELECTRON_ARGS $DISOWN_CMD"

alias android-studio="$APP_CMD android-studio"
alias android-studio-bg="$APP_CMD nohup android-studio $DISOWN_CMD"

alias kitty="$APP_CMD kitty"
alias kitty-bg="$APP_CMD nohup kitty $DISOWN_CMD"

alias anki="$APP_CMD anki"
alias anki-bg="$APP_CMD nohup anki $DISOWN_CMD"

alias torrent="$APP_CMD transmission-gtk"
alias torrent-bg="$APP_CMD nohup transmission-gtk $DISOWN_CMD"

alias pavucontrol="$APP_CMD pavucontrol"
alias pavucontrol-bg="$APP_CMD nohup pavucontrol $DISOWN_CMD"

alias lossless-scaling="$APP_CMD lsfg-vk-ui"
alias lossless-scaling-bg="$APP_CMD nohup lsfg-vk-ui $DISOWN_CMD"

alias steam="$APP_CMD steam"
alias steam-bg="$APP_CMD nohup steam $DISOWN_CMD"

alias heroic="$APP_CMD heroic"
alias heroic-bg="$APP_CMD nohup heroic $DISOWN_CMD"

alias pcsx2="$APP_CMD pcsx2"
alias pcsx2-bg="$APP_CMD nohup pcsx2 $DISOWN_CMD"

alias rpcs3="$APP_CMD rpcs3"
alias rpcs3-bg="$APP_CMD nohup rpcs3 $DISOWN_CMD"

alias prismlauncher="$APP_CMD prismlauncher"
alias prismlauncher-bg="$APP_CMD nohup prismlauncher $DISOWN_CMD"

alias emulator="$APP_CMD $ANDROID_HOME/emulator/emulator"

alias qimgv="$APP_CMD qimgv"
alias qimgv-bg="$APP_CMD nohup qimgv $DISOWN_CMD"

alias gallery="$APP_CMD nohup qimgv . $DISOWN_CMD"
alias media='gallery'

alias mpv="$APP_CMD mpv"
alias video='mpv'

alias swayimg="$APP_CMD swayimg"
alias image='swayimg'
alias img='swayimg'

alias code='nvim'
alias calc='wcalc'
alias htop='monitor'

alias rm='trash-put'
alias rm-trash='trash-rm'
alias purge='cmd rm -rf'
alias rmdir='trash-put'
alias clean='trash-empty -f'
alias trash='trash-list'
alias restore='trash-restore'

alias storage-check='fd -d 1 -H . | xargs -P 4 -I {} du -sh "{}" 2>/dev/null | sort -hr'
alias disk-check='df -h -x tmpfs -x devtmpfs -x squashfs'
alias service-check='systemctl --failed'

alias docker-clean='docker system prune -a --volumes && docker volume prune -a'
alias cache-clean='rm -rf ~/.cache && pac-cache && pnpm cache delete && pnpm store prune && npm cache clean --force && clean'

alias cat='bat'
alias man='batman'
alias gp='batgrep'
alias rg='batgrep'
alias grep='batgrep'
alias diff='batdiff'
alias watch='batwatch'

alias ls='eza'
alias cd='z'
alias find='fd'

# Abbreviations
abbr -a --position anywhere -- --help '--help 2>&1 | bat -plhelp'


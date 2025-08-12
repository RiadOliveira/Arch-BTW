# Aliases
alias cmd='command'

alias pac-up='paru -Syu'
alias pac-add='paru -S'
alias pac-info='paru -Qi'
alias pac-purge='paru -Rns'
alias pac-check='paru -Q'
alias pac-cache='paru -Scc --noconfirm'
alias pac-clean='paru -Rns $(paru -Qdtq)'

alias browser="$SANDBOX $FIREFOX"
alias browser-bg="$APP_CMD nohup firejail $FIREFOX $DISOWN_CMD"

alias firefox-developer-edition="$SANDBOX $FIREFOX"
alias firefox-developer-edition-bg="$APP_CMD nohup firejail $FIREFOX $DISOWN_CMD"

alias vscode="$APP_CMD code . --password-store='gnome-libsecret' $ELECTRON_ARGS"
alias vscode-bg="$APP_CMD nohup firejail code . --password-store='gnome-libsecret' $ELECTRON_ARGS $DISOWN_CMD"

alias discord="$SANDBOX discord $ELECTRON_ARGS"
alias discord-bg="$APP_CMD nohup firejail discord $ELECTRON_ARGS $DISOWN_CMD"

alias obsidian="$APP_CMD obsidian $ELECTRON_ARGS"
alias obsidian-bg="$APP_CMD nohup obsidian $ELECTRON_ARGS $DISOWN_CMD"

alias beekeeper-studio="$APP_CMD beekeeper-studio $ELECTRON_ARGS"
alias beekeeper-studio-bg="$APP_CMD nohup beekeeper-studio $ELECTRON_ARGS $DISOWN_CMD"

alias kitty="$APP_CMD kitty"
alias kitty-bg="$APP_CMD nohup kitty $DISOWN_CMD"

alias anki="$APP_CMD anki"
alias anki-bg="$APP_CMD nohup anki $DISOWN_CMD"

alias emulator="$APP_CMD $ANDROID_HOME/emulator/emulator"

alias qimgv="$APP_CMD qimgv"
alias qimgv-bg="$APP_CMD nohup qimgv $DISOWN_CMD"

alias gallery="$APP_CMD nohup qimgv . $DISOWN_CMD"
alias media='gallery'

alias mpv="$SANDBOX mpv"
alias video="$SANDBOX mpv"

alias swayimg="$SANDBOX swayimg"
alias image="$SANDBOX swayimg"
alias img="$SANDBOX swayimg"

alias code='nvim'
alias calc='wcalc'
alias htop='monitor'

alias rm='trash-put'
alias rmdir='trash-put'
alias clean='trash-empty -f'
alias trash='trash-list'
alias purge='trash-rm'
alias restore='trash-restore'

alias storage-check='du -sh .* * 2>/dev/null | sort -hr'
alias disk-check='df -h -x tmpfs -x devtmpfs -x squashfs'
alias service-check='systemctl --failed'

alias docker-clean='docker system prune -a --volumes'
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


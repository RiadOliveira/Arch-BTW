# Aliases
alias cmd='command'

alias pac-up='paru -Syu'
alias pac-add='paru -S'
alias pac-info='paru -Qi'
alias pac-purge='paru -Rns'
alias pac-check='paru -Q'
alias pac-cache='paru -Scc --noconfirm'
alias pac-clean='paru -Rns $(paru -Qdtq)'

alias browser="$APP_CMD $FIREFOX"
alias browser-bg="$APP_CMD nohup $FIREFOX $DISOWN_CMD"

alias firefox-developer-edition="$APP_CMD $FIREFOX"
alias firefox-developer-edition-bg="$APP_CMD nohup $FIREFOX $DISOWN_CMD"

alias vscode="$APP_CMD code . --password-store='gnome-libsecret' $ELECTRON_ARGS"
alias vscode-bg="$APP_CMD nohup code . --password-store='gnome-libsecret' $ELECTRON_ARGS $DISOWN_CMD"

alias discord="$APP_CMD discord $ELECTRON_ARGS"
alias discord-bg="$APP_CMD nohup discord $ELECTRON_ARGS $DISOWN_CMD"

alias obsidian="$APP_CMD obsidian $ELECTRON_ARGS"
alias obsidian-bg="$APP_CMD nohup obsidian $ELECTRON_ARGS $DISOWN_CMD"

alias beekeeper-studio="$APP_CMD beekeeper-studio $ELECTRON_ARGS"
alias beekeeper-studio-bg="$APP_CMD nohup beekeeper-studio $ELECTRON_ARGS $DISOWN_CMD"

alias kitty="$APP_CMD kitty"
alias kitty-bg="$APP_CMD nohup kitty $DISOWN_CMD"

alias mpv="$APP_CMD mpv"
alias video="$APP_CMD mpv"

alias swayimg="$APP_CMD swayimg"
alias image="$APP_CMD swayimg"
alias img="$APP_CMD swayimg"

alias code='nvim'
alias calc='wcalc'
alias htop='monitor'

alias rm='trash-put'
alias rmdir='trash-put'
alias clean='trash-empty -f'
alias trash='trash-list'
alias purge='trash-rm'
alias restore='trash-restore'

alias storage-check='fd -H -d 1 -X du -sh {} + 2>/dev/null | sort -hr'
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


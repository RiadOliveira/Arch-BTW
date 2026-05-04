# Aliases
alias cmd='command'

alias pac-up='yay -Syu'
alias mirrors-up='systemctl start reflector'

alias pac-add='yay -S'
alias pac-purge='yay -Rns'
alias pac-check='yay -Q'
alias pac-info='yay -Qi'
alias pac-own='yay -Qo'
alias pac-cache='yes | yay -Scc'
alias pac-clean='yay -Rns $(yay -Qdtq)'

alias zen-browser='zen-browser --new-window about:newtab'
alias discord='discord --ozone-platform=x11'
alias beekeeper-studio='beekeeper-studio --ozone-platform=x11'

alias obsidian="obsidian $ELECTRON_ARGS"
alias chromium="chromium --user-data-dir=/tmp/chromium-temp-profile $ELECTRON_ARGS"

alias emulator="uwsm app -- $ANDROID_HOME/emulator/emulator"

alias code='nvim'
alias calc='qalc'

alias rm='trash-put'
alias rm-trash='trash-rm'
alias rmdir='trash-put'
alias clean='trash-empty -f'
alias trash='trash-list'
alias restore='trash-restore'

alias storage-check='du -sh * .* 2>/dev/null | sort -hr'
alias disk-check='df -h -x tmpfs -x devtmpfs -x squashfs'
alias service-check='systemctl --failed'

alias docker-clean='docker system prune -a --volumes && docker volume prune -a'
alias cache-clean='rm -rf ~/.cache && pnpm cache delete && pnpm store prune && npm cache clean --force && clean'

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


# Aliases
alias cmd='command'

alias pac-up='paru -Syu'
alias pac-add='paru -S'
alias pac-info='paru -Qi'
alias pac-purge='paru -Rns'
alias pac-check='paru -Q'
alias pac-cache='paru -Scc --noconfirm'
alias pac-clean='paru -Rns $(paru -Qdtq)'

alias storage-check='fd -H -d 1 -X du -sh {} + 2>/dev/null | sort -hr'
alias cache-clean='rm -rf ~/.cache && paru -Scc --noconfirm && pnpm cache delete && npm cache clean --force'

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
alias mpv-bg="$APP_CMD nohup mpv $DISOWN_CMD"

alias video="$APP_CMD mpv"
alias video-bg="$APP_CMD nohup mpv $DISOWN_CMD"

alias swayimg="$APP_CMD swayimg"
alias swayimg-bg="$APP_CMD nohup swayimg $DISOWN_CMD"

alias image="$APP_CMD swayimg"
alias image-bg="$APP_CMD nohup swayimg $DISOWN_CMD"

alias img="$APP_CMD swayimg"
alias img-bg="$APP_CMD nohup swayimg $DISOWN_CMD"

alias code='nvim'
alias calc='wcalc'
alias htop='monitor'

alias rm='trash-put'
alias rmdir='trash-put'
alias clean='trash-empty'
alias trash='trash-list'
alias purge='trash-rm'
alias restore='trash-restore'

alias cat='bat'
alias man='batman'
alias gp='batgrep'
alias rg='batgrep'
alias grep='batgrep'
alias diff='batdiff'
alias watch='batwatch'

alias l='eza'
alias ls='eza'
alias cd='z'
alias cdf='cd $(fd -H -td . ~ | fzf)'
alias find='fd'

alias preview='fzf --preview "if test -d {}; eza -1 --color=always {}; else; bat -n --color=always --line-range=:100 {}; end"'
alias preview-files='fd -tf | fzf --preview "bat -n --color=always --line-range=:100 {}"'
alias preview-folders='fd -td | fzf --preview "eza -1 --color=always {}"'

# Check
function check
  fd $argv | while read -l item
    test -d $item; and eza $item; or bat $item
  end
end

# Bathelp
function help
  $argv --help 2>&1 | bat -plhelp 
end

abbr -a --position anywhere -- --help '--help | bat -plhelp'

# Torrent
function torrent
  set TEMP (mktemp)
  printf '#!/bin/bash\nkillall transmission-cli 2>/dev/null\nrm -- "$0"\n' > $TEMP

  chmod +x $TEMP
  transmission-cli -D -f $TEMP -w ~/Downloads $argv
end


# Aliases
alias browser='eval "$APP_CMD nohup firefox-developer-edition $DISOWN_CMD"'
alias firefox='eval "$APP_CMD nohup firefox-developer-edition $DISOWN_CMD"'
alias firefox-dev='eval "$APP_CMD nohup firefox-developer-edition $DISOWN_CMD"'
alias firefox-developer-edition='eval "$APP_CMD nohup firefox-developer-edition $DISOWN_CMD"'

alias code='eval "$APP_CMD code --password-store="gnome-libsecret" $ELECTRON_ARGS"'
alias discord='eval "$APP_CMD nohup discord $ELECTRON_ARGS $DISOWN_CMD"'
alias obsidian='eval "$APP_CMD nohup obsidian $ELECTRON_ARGS $DISOWN_CMD"'
alias beekeeper-studio='eval "$APP_CMD nohup beekeeper-studio $ELECTRON_ARGS $DISOWN_CMD"'

alias htop='themed-htop'

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

alias cd='z'
alias ls='eza'
alias find='fd'

alias preview='fzf --preview "if test -d {}; eza -1 --color=always {}; else; bat -n --color=always --line-range=:100 {}; end"'
alias preview-files='fd -tf | fzf --preview "bat -n --color=always --line-range=:100 {}"'
alias preview-folders='fd -td | fzf --preview "eza -1 --color=always {}"'

# Check
function check
  fd $argv -X bat
end

# Bathelp
function help
  $argv --help 2>&1 | bat -plhelp 
end

abbr -a --position anywhere -- --help '--help | bat -plhelp'

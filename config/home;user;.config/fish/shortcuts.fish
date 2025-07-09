# Aliases
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

alias find='fd'

alias cd='z'

alias ls='eza'

alias preview='fzf --preview "if test -d {}; eza -1 --color=always {}; else; bat -n --color=always --line-range=:50 {}; end"'
alias preview-files='fd -tf | fzf --preview "bat -n --color=always --line-range=:50 {}"'
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

set -x FZF_DEFAULT_COMMAND 'fd'
set -x FZF_DEFAULT_OPTS '--bind "alt-k:preview-page-up,alt-j:preview-page-down" --style minimal --color "border:#1c94fc,prompt:#fc5ef0,pointer:#9c44fc,spinner:#9c44fc,info:#fc5ef0,marker:#fc5ef0"'

set -x FZF_CTRL_T_COMMAND 'fd'
set -x FZF_CTRL_T_OPTS '--preview "if test -d {}; eza -1 --color=always {}; else; bat -n --color=always --line-range=:100 {}; end"'

set -x FZF_ALT_C_COMMAND 'fd -td'
set -x FZF_ALT_C_OPTS '--preview "eza -1 --color=always {}"'

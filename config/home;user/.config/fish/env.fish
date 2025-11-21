# APP COMMANDS
set -U APP_CMD 'uwsm app --'
set -U DISOWN_CMD '> /dev/null 2>&1 & disown'

set -U ELECTRON_ARGS '--enable-features=UseOzonePlatform,WaylandLinuxDrmSyncobj --ozone-platform=wayland'

# FZF DEFAULTS
set -x FZF_DEFAULT_COMMAND 'fd'
set -x FZF_DEFAULT_OPTS '--bind "alt-k:preview-page-up,alt-j:preview-page-down" --style minimal --gutter " " --color "border:#1064ad,prompt:#fc5ef0,pointer:#9c44fc,spinner:#9c44fc,info:#fc5ef0,marker:#fc5ef0,bg+:#2a2640"'

set -x FZF_CTRL_T_COMMAND 'fd -H'
set -x FZF_CTRL_T_OPTS '--preview "if test -d {}; eza -1 --color=always {}; else; bat -n --color=always --line-range=:100 {}; end"'

set -x FZF_ALT_C_COMMAND 'fd -td -H'
set -x FZF_ALT_C_OPTS '--preview "eza -1 --color=always {}"'

# ANDROID
set -x ANDROID_HOME ~/Android/Sdk 
set -x ANDROID_AVD_HOME ~/.config/.android/avd

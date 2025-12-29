if status is-interactive
end

# Environment variables
source ~/.config/fish/env.fish

# Prompt
starship init fish | source

# Tools
zoxide init fish | source
fzf --fish | source

# Shortcuts / aliases / abbrs
source ~/.config/fish/shortcuts.fish

if status is-interactive
  # Commands to run in interactive sessions can go here
end

# Starship
starship init fish | source

# Zoxide
zoxide init fish | source

# FZF 
fzf --fish | source

# Environment Variables
source ~/.config/fish/env.fish

# Shortcuts
source ~/.config/fish/shortcuts.fish

# Source aliases
. ~/.config/fish/aliases.fish

# Starship prompt
starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
    fortune | cowsay
end

# Source aliases
. ~/.config/fish/aliases.fish

# Starship prompt
starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
    fortune | cowsay
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/tsagrista/.lmstudio/bin
# End of LM Studio CLI section


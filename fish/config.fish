# Source aliases
. ~/.config/fish/aliases.fish

# Starship prompt
starship init fish | source

if status is-interactive
    if command -q fortune
        if command -q cowsay
            set -l cow (random choice /usr/share/cowsay/cows/*.cow)
            if command -q lolcat
                fortune | cowsay -f $cow | lolcat
            else
                fortune | cowsay -f $cow
            end
        else if command -q lolcat
            fortune | lolcat
        else
            fortune
        end
    end
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/tsagrista/.lmstudio/bin
# End of LM Studio CLI section

if status is-interactive
    atuin init fish | source
end

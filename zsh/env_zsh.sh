#!/bin/zsh
    
#
# ZSH-specific shit
#

# zsh history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
bindkey -v
bindkey '^R' history-incremental-search-backward

# Disable zsh matching
setopt +o nomatch

# Automatically add directory to stack when using `cd`. Use the commands
# `pushd`, `popd` and `dirs -v` to use the stack.
setopt auto_pushd

# ZIM!
[ -f ~/.dotfiles/zsh/env_zim.sh ] && source ~/.dotfiles/zsh/env_zim.sh

# Init Starship prompt
if cmd-exists starship; then
    eval "$(starship init zsh)"
fi

# Zoxide
eval "$(zoxide init zsh)"

# Enable home/end/del
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Move to CWD when exiting yazi, and use y for yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ivan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
. "$HOME/.cargo/env"

# Starship Prompt
eval "$(starship init zsh)"

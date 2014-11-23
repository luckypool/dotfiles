#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[ -f $HOME/.zshrc.custom ] && source $HOME/.zshrc.custom
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

# added by travis gem
[ -f /Users/luckypool/.travis/travis.sh ] && source /Users/luckypool/.travis/travis.sh

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

#
# Other environmental variable
#

export GOPATH="$HOME/.gocode"

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi



# Set the list of directories that Zsh searches for programs.
export PATH=$HOME/.bin:$HOME/.cabal/bin:$HOME/.npm-global/bin:$GOPATH/bin:$HOME/.local/bin:$PATH


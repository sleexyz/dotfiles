# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Bindings
set -o vi
bindkey 'jk' vi-cmd-mode
bindkey "^R" history-incremental-search-backward

# Aliases
alias vi='nvim'
alias vim='nvim'
alias gp='git push'
alias rm='nocorrect rm'
#alias gpg="/usr/bin/gpg2"
alias git="hub"
alias sl="ls"
alias ns="nix-shell --run"
alias nse="nix-shell --run emacs &"
alias upload="stack upload . && genhaddock sleexyz"
alias -g .fast='--fast --ghc-options="-Wall -j +RTS -A1024m -n2m -RTS"'

export SC_JACK_DEFAULT_INPUTS="system:capture_1,system:capture_2"
export SC_JACK_DEFAULT_OUTPUTS="system:playback_1,system:playback_2"

alias scsynth="scsynth -u 57110"

[[ -s "/home/slee2/.gvm/scripts/gvm" ]] && source "/home/slee2/.gvm/scripts/gvm"

# set overwrite of files during piping
setopt CLOBBER
unsetopt AUTO_CD

# source z
. $HOME/.bin/z.sh

echo "    most frecent directories:\n"
z | tail -n 8
echo

# OPAM configuration
. /home/slee2/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export ZSH="$HOME/.oh-my-zsh"

export EDITOR="nvim"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias q="exit"
alias lg="lazygit"
alias n="nvim"
alias bat-info="cat /sys/class/power_supply/BAT0/uevent"
alias dt="~/.backups/dotfiles/copy.sh"

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"


function yo() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

functions y() {
  if [ "$1" != "" ]; then
    if [ -d "$1" ]; then
      yo "$1"
    else
      yo "$(zoxide query $1)"
    fi
  else
    yo
  fi
    return $?
}

function acp() {
    git add .
    git commit -m $1
    git push
}

#cat ~/sudhir.txt

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

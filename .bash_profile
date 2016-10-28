PATH=$PATH:~/bin

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

green=$(tput setaf 2)
blue=$(tput setaf 4)
bold=$(tput bold)
red=$(tput setaf 1)
reset=$(tput sgr0)
PS1='\u@\[$green\]\h\[$reset\]:\w\[$blue\]$(__git_ps1)\[$reset\] \$ '

export VISUAL=vim
export EDITOR="$VISUAL"

alias ls='ls --color=always'
LS_COLORS=$LS_COLORS:'di=0;34:'
export LS_COLORS
export GREP_OPTIONS='--color=always'
export GREP_COLORS='sl=33:fn=35:ms=01;36'


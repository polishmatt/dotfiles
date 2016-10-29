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
set -o vi

alias ls='ls --color=always'
LS_COLORS=$LS_COLORS:'di=0;34:'
export LS_COLORS
export GREP_OPTIONS='--color=always'
export GREP_COLORS='sl=33:fn=35:ms=01;36'

alias dutop='du -hsx * | sort -rh | head -n10'
alias weather='curl -s wttr.in/ny | head -n17'


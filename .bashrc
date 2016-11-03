. $HOME/.profile

if [ -f $HOME/.git-completion.bash ]; then
    . $HOME/.git-completion.bash
fi

if [ -f $HOME/.git-prompt.sh ]; then
    . $HOME/.git-prompt.sh
fi

green=$(tput setaf 2)
yellow=$(tput setaf 3)
bold=$(tput bold)
red=$(tput setaf 1)
reset=$(tput sgr0)
PS1='\u@\[$green\]\h\[$reset\]:\w\[$yellow\]$(__git_ps1)\[$reset\] \$ '

alias ls='ls --color=always'

alias dutop='du -hsx * | sort -rh | head -n10'
alias weather='curl -s wttr.in/ny | head -n17'

if [ -f $HOME/.bash_local ]; then
    . $HOME/.bash_local
fi


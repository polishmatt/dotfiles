
export VISUAL=vim
export EDITOR="$VISUAL"
set -o vi

if [ -d $HOME/bin ]; then
    PATH=$PATH:$HOME/bin
fi

LS_COLORS=$LS_COLORS:'di=0;34:'
export LS_COLORS
export GREP_OPTIONS='--color=always'
export GREP_COLORS='sl=33:fn=35:ms=01;36'

# if interactive
if [[ $- == *i* ]]; then
    . $HOME/.bashrc
fi


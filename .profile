
export VISUAL=vim
export EDITOR="$VISUAL"
set -o vi

if [ -d $HOME/bin ]; then
    PATH=$PATH:$HOME/bin
fi

LS_COLORS=$LS_COLORS:'ow=01;36:di=0;93:'
export LS_COLORS
export GREP_OPTIONS='--color=always'
export GREP_COLORS='sl=33:fn=35:ms=01;36'
if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi


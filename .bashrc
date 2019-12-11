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

ls --color=always &> /dev/null && alias ls='ls --color=always' || alias ls='ls -G'

alias dutop='du -hsx * | sort -rh | head -n10'
alias weather='curl -s wttr.in/ny | head -n17'

git() {
    if [ $1 == "blame" ] && [ $2 == "-w" ]; then
        set -- "$1" "${@:3}"
    elif [ $1 == "blame" ]; then
        set -- "$@" -w
    fi
    command git "$@"
}

streams() {
    { { $@; } 2>&3 | sed 's/^/STDOUT: /'; } 3>&1 1>&2 | sed 's/^/STDERR: /'
}

__srep_escape() {
    echo "$@" | sed s/\\\//\\\\\\//
}
srep() {
    expression=$(__srep_escape $1)
    replacement=$(__srep_escape $2)
    path="$3"
    if [[ "$path" == "" ]]; then
        path="."
    fi
    name="$4"
    if [[ "$name" != "" ]]; then
        name=" -name $name"
    fi

    find $path -type f$name -exec perl -p -i -e s/$expression/$replacement/ {} +
}

if [ -f $HOME/.bash_local ]; then
    . $HOME/.bash_local
fi

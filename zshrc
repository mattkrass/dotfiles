setopt prompt_subst
setopt extended_glob
export TERM=xterm-256color
export HISTFILE=/home/mkrass1/.zsh_history
export HISTSIZE=2500
export SAVEHIST=2500
export MBIG="/bb/mbige/mbig4627"
export FAMKE_BUILDBASE=${MBIG}/famke
export PROJDIR=${MBIG}/projects
git-prompt-info() {
    git_status=$(git status 2>&1)
    branch_name=$(echo $git_status | grep "On branch" | cut -d" " -f3)
    clean_status=$(echo $git_status | grep "clean")
    if [[ -n $branch_name ]]; then
        if [[ -z $clean_status ]]; then
            print -P %F{red}\($branch_name\)%f
        else
            print -P %F{green}\($branch_name\)%f
        fi
    fi
}

PROMPT='[%D{%H:%M:%S}] %F{34}%n@%B%m%b%f:%B%F{63}%/%f%b $(git-prompt-info)
'
RPROMPT=''
bindkey "^?" backward-delete-char
bindkey '^R' history-incremental-search-backward
autoload -U compinit
compinit -u

# source aliases
source ~/.zshenv

# functions
npad() {
    # \xterm -fg \#22ff22 -cr \#22ff22 -bg black -fn 10x20 -geometry 70x60 -title $1 -e /bin/vi $1 &
    gvim -geometry 70x60 $1 
}

mcd() {
    mkdir -p $1; cd $1
}

ghc() {
    git clone bbgithub:$1 $1
}

tmux-prod-colors() {
    if [ $TMUX ]; then
        ${PROJDIR}/tmux/tmux select-pane -P 'fg=colour2,bg=colour17'
    fi
}

tmux-remote-colors() {
    if [ $TMUX ]; then
        ${PROJDIR}/tmux/tmux select-pane -P 'fg=colour6,bg=colour21'
    fi
}

tmux-default-colors() {
    if [ $TMUX ]; then
        ${PROJDIR}/tmux/tmux select-pane -P 'default'
    fi
}

prdwinf() {
    tmux-prod-colors
    clear
    getprdwin -u op1 -s $1 -i -d etc 
    tmux-default-colors
}

prdwin() {
    if [ $SSH_TTY ]; then
        echo "You shouldn't do this from a ssh remote!"
        return 1
    fi
    prdwinf $1
}

tm() {
    tmux attach
    if [[ $? != 0 ]]; then
        ~/launch_tmux.sh
    fi
}

srchcpp() {
    grep "$@" -R * --include='*.cpp' -n -H
}

srchhdr() {
    grep "$@" -R * --include='*.h' -n -H
}

srchsrc() {
    grep "$@" -R * --include='*.h' --include='*.cpp' --include='*.c' --include='*.py' --include='*.pl' --include='*.sh' --include='*.js' --include='*.ts' --include='*.cs' -n -H
}

gsa() {
    for d in */; do
        cd $d
        git status
        cd ..
    done
}

gpa() {
    for d in */; do
        cd $d
        git pull origin master
        cd ..
    done
}

getips() {
    for rhst in "$@"
    do
        HOSTS=`grep -i $rhst /bb/bin/bbcpu.lst | cut -d' ' -f1`
        for host in $HOSTS
        do
            nslookup $host | grep "Address:" | tail -1 | sed -e "s/Address/$host/"
        done
    done
}

exd() {
    NEWDISPLAY=`tmux show-environment | grep DISPLAY`
    export $NEWDISPLAY
}

clf() {
    GLOB=$1
    SRCHPATH=$2
    if [[ -z $SRCHPATH ]]; then
        SRCHPATH=.
    fi

    echo GLOB=$GLOB and SRCHPATH=$SRCHPATH
    INITMARK=`find $SRCHPATH -name "$GLOB*" -type f -printf "%T@ %p\n" | sort -n | tail -n 1`
    LATESTMARK=$INITMARK
    echo "Saw $INITMARK, waiting for next file to match pattern..."
    while [[ $INITMARK == $LATESTMARK ]]; do
        sleep 1
        LATESTMARK=`find $SRCHPATH -name "$GLOB*" -type f -printf "%T@ %p\n" | sort -n | tail -n 1`
    done
    echo "Capturing $LATESTMARK:"
    LATESTFILE=`echo $LATESTMARK | cut -d' ' -f 2`
    tail -n 100 -f $LATESTFILE | bblc
}

sizedirs() {
    for i in `lrt | grep '^d' | rev | cut -d' ' -f 1 | rev | sed -e 's./..'`
    do
        du -csh $i | grep -v total
    done
}

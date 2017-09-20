# ENVIRONMENT VARIABLES
    export MBIG="/bb/mbige/mbig4627"
    export FAMKE_BUILDBASE=${MBIG}/famke
    export PROJDIR=${MBIG}/projects

#ALIASES
    alias lrt="ls -lrt"
    alias ll="ls -l"
    alias ls="ls -p" 
    alias glg="git log --pretty=format:\"[%h} %ar, %s\""
    alias glgh="git log --pretty=format:\"[%h} %ar, %s\" | head -n 20"
    alias gd="git diff"
    alias gst="git status"
    alias gdv="git difftool --tool=vimdiff --no-prompt"
    alias gdg="git difftool --tool=gvimdiff --no-prompt"
    alias gpu="git push -u origin \$(git status | grep 'On branch' | sed -e 's/On branch //g')"
    alias gc="git commit"
    alias gca="git commit -a"
    alias gcm="git commit -m"
    alias slg="svn log"
    alias sd="svn diff"
    alias sst="svn status --quiet"
    alias sc="svn commit"
    alias scm="arc commit -m"
    alias ad="arc diff"
    alias ac="arc commit"
    alias acm="arc commit -m"
    alias gv="gvim --remote-tab-silent"
    alias gvim="gvim -geometry 160x100"
    alias vi="vim"
    alias more="less"
    alias runbig="/bbsrc/prodbigs/sun/faxbig.tsk mbig4627 &"
    alias runbigfg="clear;/bbsrc/prodbigs/sun/faxbig.tsk mbig4627"
    alias sctd="ssh clang-tidy-dev.fit-trading.dob1.bcpc.bloomberg.com"
    alias sct="ssh clang-tidy.fit-trading.dob1.bcpc.bloomberg.com"
    alias stpnsd="sftp -i ${PROJDIR}/sshkeys/stpnsd.key -P 30206 STPNSD@ftp1ny.bloomberg.com"
    alias tstnsd="sftp -i ${PROJDIR}/sshkeys/stpnsd.key -P 30206 TSTNSD@ftp1ny.bloomberg.com"
    alias fsscb1="sftp -i ${PROJDIR}/sshkeys/stpnsd.key -P 30206 FSSCB@ftp1ny.bloomberg.com"
    alias fsscb2="sftp -i ${PROJDIR}/sshkeys/stpnsd.key -P 30206 FSSCB@ftp2ny.bloomberg.com"
    alias xtermbig="\xterm -fg \#ff9922 -cr \#ff9922 -bg black -fn 10x20 -e ${SHELL}"
    alias xtermas="\xterm -bg \#282828 -cr \#ffaa00 -fg \#ffaa00 -fn 10x20 -e ${SHELL}"
    alias xtermws="\xterm -bg \#dddddd -fg black -fn 6x13 -e ${SHELL}"
    alias xtermys="\xterm -bg \#ffffbb -fg black -fn 6x13 -e ${SHELL}"
    alias xtermos="\xterm -bg \#ffddbb -fg black -fn 6x13 -e ${SHELL}"
    alias xtermps="\xterm -bg \#eebbff -fg black -fn 6x13 -e ${SHELL}"
    alias xtermgs="\xterm -bg \#ccffdd -fg black -fn 6x13 -e ${SHELL}"
    alias xtermbs="\xterm -bg \#ccddff -fg black -fn 6x13 -e ${SHELL}"
    alias xtermbws="\xterm -fg \#dddddd -cr \#dddddd -bg black -fn 6x13 -geometry 200x60 -e ${SHELL}"
    alias xtermbas="\xterm -fg \#ff9922 -cr \#ff9922 -bg black -fn 6x13 -geometry 200x60 -e ${SHELL}"
    alias xtermbgs="\xterm -fg \#22ff22 -cr \#22ff22 -bg black -fn 6x13 -geometry 200x60 -e ${SHELL}"
    alias xtermbbs="\xterm -fg \#22ddff -cr \#22ddff -bg black -fn 6x13 -geometry 200x60 -e ${SHELL}"
    alias xtermbw="\xterm -fg \#dddddd -cr \#dddddd -bg black -fn 10x20 -geometry 200x60 -e ${SHELL}"
    alias xtermba="\xterm -fg \#ff9922 -cr \#ff9922 -bg black -fn 10x20 -geometry 200x60 -e ${SHELL}"
    alias xtermbg="\xterm -fg \#22ff22 -cr \#22ff22 -bg black -fn 10x20 -geometry 200x60 -e ${SHELL}"
    alias xtermbb="\xterm -fg \#22ddff -cr \#22ddff -bg black -fn 10x20 -geometry 200x60 -e ${SHELL}"
    alias jrnl="\xterm -fg \#ff9922 -cr \#ff9922 -bg black -fn 10x20 -geometry 70x60 -title Journal -e /bin/vi ${PROJDIR}/journal.txt &"
    alias logterm="\xterm -bg \#222222 -fg yellow -cr yellow -fn 6x13 -e /bin/bash&"
    alias logterm2="\xterm -bg \#666666 -fg yellow -cr yellow -fn 6x13 -e /bin/bash&"
    alias renew="/opt/quest/bin/vastool kinit"
    alias pl="plink -d stage -noso"
    alias pla="plink -d stage -noso -all"
    alias ecl="eclipse > /dev/null 2>&1 &"
    alias pyg="pygmentize -O style=monokai -f terminal256 -g"
    alias less="less -r"

    alias gvimT="gvim -fg black -bg \#dddddd -fn '-*-consolas-medium-r-*-*-26-*-95-*-m-0-suneu-*' "
    alias xtermT="\xterm -fg black -cr black -bg \#dddddd -fn '-*-consolas-medium-r-*-*-26-*-95-*-m-0-suneu-*' -e ${SHELL}"

    alias ctags="/bbsrc/princeton/skunk/bin/ctags"

    alias print_src="a2ps -1 --line-numbers=1 -P${PRINTER:-prog_P271}"
    #alias print_src_color="a2ps -1 --pro=color --line-numbers=1 -P${PRINTER:-prog_P271}"

    alias mbig="cd ${MBIG}"
    alias proj="cd ${PROJDIR}"
    alias cfmgmt="cd ${PROJDIR}/cfmgmt"
    alias fstnblot="cd ${PROJDIR}/cfmgmt/fstnblot/s_fstnblot"
    alias fstnxfer="cd ${PROJDIR}/cfmgmt/fstnxfer"
    alias green_font="echo -e \"\e[32m\" "
    alias white_font="echo -e \"\e[0;37m\" "
    alias cyan_font="echo -e \"\e[0;36m\" "
    alias reset_font="echo -e \"\e[0m\" "
    alias xts="xts.sh"
    alias eclipse_wizard="~pshepher/bin/eclipse_wizard.py"
    alias prd0278="prdwin n278"
    alias prd0279="prdwin p279"
    alias prd0501="prdwin sundev19"
    alias prd0907="prdwin y907"
    alias prd0908="prdwin j908"
    alias prd0890="prdwin p890"
    alias prd0889="prdwin n889"
    alias prd1743="prdwin y743"
    alias prd1081="prdwin j081"
    alias prd2225="prdwin k225"
    alias prd1305="prdwin j305"
    alias prd1135="prdwin y135"
    alias prd1136="prdwin j136"
    alias prd0966="prdwin ficlnybfitap01"
    alias prd0969="prdwin ficlnjbfitap01"
    alias prd4472="prdwin g0qa"
    alias sd48='ssh sundev48'
    alias sd47='ssh sundev47'
    alias sd38='ssh sundev38'
    alias nyl01='ssh ficlnydficev01'
    alias njl01='ssh ficlnjdficev01'
    alias h="fc -l -100"
    alias rbrc="unalias -a; TMUX= source ~/.bashrc"
    alias mstr="git checkout master"
    alias mkr1="git checkout mkrass1"
    alias cdc="cd;clear"
    alias jpssi="./setWindowTitle.py 'Jurassic Park, System Security Interface, Version 4.0.5, Alpha E'"

# FUNCTIONS
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

    ssh() {
        #tmux-remote-colors
        clear
        command ssh "$@"
        tmux-default-colors
    }

    ssh-nc() {
        clear
        command ssh "$@"
    }

    tm() {
        tmux attach
        if [[ $? != 0 ]]; then
            ~/launch_tmux.sh
        fi
    }

    tm-split() {
        if [[ ! -f ~/.tmux.split.in.progress ]]; then
            touch ~/.tmux.split.in.progress
            tmux split-window -h
            tmux split-window -v
            tmux split-window -v
            tmux resize-pane -y 35 -t 2
            tmux resize-pane -y 35 -t 3
            tmux resize-pane -y 35 -t 4
            tmux select-pane -t 0.1
            sleep 1
            rm ~/.tmux.split.in.progress
        fi
    }

    migrate-svn-to-git()
    {
        if [[ -z $2 ]]; then
            echo 'Provide SVN path and org name!'
            return 1
        fi

        REPONAME=`echo $1 | sed -e 's,\(.*\/\)\(.*\),\2,'`
        echo Cloning $1 in to $REPONAME
        git svn clone $1 $REPONAME --log-window-size=100000
        cd $REPONAME
        echo Adding remote
        git remote add origin bbgithub:$2/$REPONAME
        echo Pushing repo
        git push -u origin master
        echo Open repo at https://bbgithub.dev.bloomberg.com/$2/$REPONAME
        echo Enable branch protection on master! Immediately!
    }

    r()
    {
        CMD=`fc -l -100 | grep ^$1 | sed -e 's,^[0-9 \t]*\(.*\),\1,'`
        $CMD
    }

    lt() {
        clear
        tail -f -n 10 $1 | bblc
    }

    llc() {
        llcalc --buildtag=stage --create $1 && llcalc --buildtag=stage --run --unbounded $1
    }

    srchcpp() {
        grep "$@" -R * --include=*.cpp -n -H
    }

    srchhdr() {
        grep "$@" -R * --include=*.h -n -H
    }

    srchsrc() {
        grep "$@" -R * --include=*.h --include=*.cpp --include=*.c --include=*.py --include=*.pl --include=*.sh --include=*.js --include=*.ts --include=*.cs -n -H
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

# ENABLE COLORS
    export TERM=xterm-256color

# SHELL EDITING OPTIONS
    set -o vi

# SETTING PROMPT
    source ~/.git-completion.sh

    function prompt {
        local RED="\[\033[0;31m\]"
        local GREEN="\[\033[0;32m\]"
        local BLACKBOLD="\[\033[1;30m\]"
        local BLUEBOLD="\[\033[1;34m\]"
        local RESET="\[\033[00m\]"
        export PS1="\n$BLACKBOLD[\t]$GREEN \u@\h$RESET:$BLUEBOLD\$PWD$RESET$RED"'$(__git_ps1)'"$RESET\n"
    }

    prompt
    #jpssi
    #echo "System Ready"

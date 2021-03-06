# aliases
alias lrt="ls -lrt"
alias ll="ls -l"
alias ls="ls -p" 
alias glg="git log --pretty=format:\"[%h} %ar, %s\""
alias glgh="git log --pretty=format:\"[%h} %ar, %s\" | head -n 20"
alias gd="git diff"
alias gst="git status -sb"
alias gdv="git difftool --tool=vimdiff --no-prompt"
alias gdg="git difftool --tool=gvimdiff --no-prompt"
alias gpu="git push -u origin \$(git status | grep 'On branch' | sed -e 's/On branch //g')"
alias gff="git pull origin \$(git status | grep 'On branch' | sed -e 's/On branch //g') --ff-only"
alias gffu="git pull upstream \$(git status | grep 'On branch' | sed -e 's/On branch //g') --ff-only"
alias gcxffd='echo -n "Confirm nuclear option? " && read answer && if [ "yes" = "${answer}" ] ; then git clean -x -f -f -d ; fi'
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
alias ecl="eclipse > /dev/null 2>&1 &"
alias pyg="pygmentize -O style=monokai -f terminal256 -g"
alias less="less -r"
alias gvimT="gvim -fg black -bg \#dddddd -fn '-*-consolas-medium-r-*-*-26-*-95-*-m-0-suneu-*' "
alias xtermT="\xterm -fg black -cr black -bg \#dddddd -fn '-*-consolas-medium-r-*-*-26-*-95-*-m-0-suneu-*' -e ${SHELL}"
alias green_font="echo -e \"\e[32m\" "
alias white_font="echo -e \"\e[0;37m\" "
alias cyan_font="echo -e \"\e[0;36m\" "
alias reset_font="echo -e \"\e[0m\" "
alias xts="xts.sh"
alias h="fc -l -100"
alias rbrc="unalias -a; TMUX= source ~/.zshrc"
alias mstr="git checkout master"
alias mkr1="git checkout mkrass1"
alias cdc="cd;clear"
alias vbl="vim -c ':bufdo checkt' -c ':syntax on'"

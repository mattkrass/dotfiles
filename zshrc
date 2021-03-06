setopt prompt_subst
setopt extended_glob
setopt inc_append_history
setopt share_history
setopt autopushd
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=2500
export SAVEHIST=2500

function zle-line-init zle-keymap-select {
    PROMPT='$(rc-prompt-info) [%D{%H:%M:%S}] %F{34}%n@%B%m%b%f:%B%F{63}%/%f%b $(git-prompt-info)
${${KEYMAP/vicmd/%F{white\}%K{red\}normal%f%k }/(main|viins)/%F{white\}%K{green\}insert%f%k }➡ '
    RPROMPT=''
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

rc-prompt-info() {
    local RC=$?
    local OUT=$(printf '%03d' $RC)
    if [[ $RC -ne 0 ]]; then
        print -P "\033[41m\033[37m$OUT\033[0m"
    else
        print -P $OUT
    fi
}

window-title() {
    print -Pn "\e]0;$1\a"
}

git-prompt-info() {
    local REPO_ROOT=$(basename $(git rev-parse --show-toplevel 2>&1 | tr '\n' ' ' | sed "s/fatal.*/\//g"))
    for d in "${(@s/;/)GIT_IGNORE}"; do
        if [[ "$REPO_ROOT" == "$d" ]]; then
            print -P %F{yellow}\($(git branch | grep \* | cut -d ' ' -f2)\)%f
            return 0
        fi;
    done

    if [[ $SIMPLE_GIT == "yes" ]]; then
        print "<git disabled>"
        return 0
    fi

    git_status=$(git status 2>&1)
    branch_name=$(echo $git_status | grep "On branch" | cut -d" " -f3)
    clean_status=$(echo $git_status | grep "working tree clean")
    if [[ -n $branch_name ]]; then
        if [[ -z $clean_status ]]; then
            print -P %F{red}\($branch_name\)%f
        else
            print -P %F{green}\($branch_name\)%f
        fi
    fi
}

tmssh() {
    if [ $TMUX ]; then
        ${TMUX_BIN} new-window -n $1 "ssh $1"
    else
        ssh $1
    fi
}

# vim mode please
bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
bindkey '^R' history-incremental-search-backward
autoload -U compinit
compinit -u

# source aliases
if [[ -a ~/.zshenv ]]; then
    source ~/.zshenv
fi

# source local zshrc if it exists
if [[ -a ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

# source local zshenv for aliases if it exists
if [[ -a ~/.zshenv.local ]]; then
    source ~/.zshenv.local
fi

# functions
npad() {
    gvim -geometry 70x60 $1 
}

mcd() {
    mkdir -p $1; cd $1
}

tm() {
    tmux attach
    if [[ $? != 0 ]]; then
        tmux
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

gbu() {
    git fetch upstream
    git checkout --no-track -b $1 upstream/master
}

sizedirs() {
    for i in `lrt | grep '^d' | rev | cut -d' ' -f 1 | rev | sed -e 's./..'`
    do
        du -csh $i | grep -v total
    done
}

if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh

    # Search a file with fzf inside a Tmux pane and then open it in an editor
    fvim() {
      local file=$(fzf)
      # Open the file if it exists
      if [ -n "$file" ]; then
        # Use the default editor if it's defined, otherwise Vim
        ${EDITOR:-vim} "$file"
      fi
    }
fi

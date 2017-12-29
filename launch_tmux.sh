#!/bin/bash
let "PANELINES = (`tput lines` - 3) / 3"
tmux new -s tmux-auto-split \; \
    split-window -h \; \
    split-window -v \; \
    split-window -v \; \
    resize-pane -y $PANELINES -t 2 \; \
    resize-pane -y $PANELINES -t 3 \; \
    resize-pane -y $PANELINES -t 4 \; \
    select-pane -t 1.1 \; \
    attach \;

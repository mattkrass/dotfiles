#!/bin/zsh
NUM_QUOTES=$(($(cat ~/.lyrics.txt | wc -l)))
SEED=$(date +%s)
SEL_IDX=$(( $SEED % $NUM_QUOTES ))
COL_IDX=$(( $SEED % 5 ))
LYRIC=$(cat ~/.lyrics.txt | tail +$SEL_IDX | head -1)

case $COL_IDX in
    0) echo -e "\015\033[3;31m$LYRIC\033[0m";;
    1) echo -e "\015\033[3;32m$LYRIC\033[0m";;
    2) echo -e "\015\033[3;33m$LYRIC\033[0m";;
    3) echo -e "\015\033[3;34m$LYRIC\033[0m";;
    4) echo -e "\015\033[3;35m$LYRIC\033[0m";;
esac

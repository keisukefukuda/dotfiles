#!/bin/sh

CWD=`pwd`
DIR=`echo $CWD | sed -e 's|.*/||'`

if [ "$DIR" != "dotfiles" ]; then
    echo "ERROR: please run this script in dotfiles/ directory."
    exit -1
fi

check_overwrite() {
    fname=$1
    if [ -f $fname ]; then
        echo "${fname} already exists. Do you want to rename *.bak and continue installation ? [Y/n]:"
        read input

        if [ $input = "" -o $input = "y" -o $input = "Y" ]; then
            echo $fname --> $fname.bak
            mv $fname $fname.bak
            return 0
        else
            return 1
        fi
    fi

    return 0
}

check_overwrite "$HOME/.tmux.conf" && {
    ln -s $CWD/.tmux.conf $HOME/.tmux.conf
}

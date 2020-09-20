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
    elif [ -L $fname ]; then
        if readlink $fname | grep $(pwd); then
            return 1	
        else
            rm -f $fname
            return 0
        fi
    fi

    return 0
}

check_overwrite "$HOME/.tmux.conf" && {
    ln -s $CWD/tmux/tmux.conf $HOME/.tmux.conf
}

check_overwrite "$HOME/.gitconfig" && {
    ln -s $CWD/gitconfig $HOME/.gitconfig
}

#!/bin/bash
set -ue

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

# starship

if ! which starship 2>/dev/null; then
    if [[ ! -f $HOME/usr/bin/starship ]]; then
	    pushd /tmp
	    curl -fsSL https://starship.rs/install.sh >starship_install.sh
	    mkdir -p $HOME/usr/bin
	    bash starship_install.sh -b $HOME/usr/bin -y
        popd
    fi
fi

# -----------------------------------------------------------------------
# zsh
# -----------------------------------------------------------------------

if [[ "${SKIP_SUBMODULE:-0}" != 0 ]]; then
	git submodule update --init --recursive
fi

check_overwrite "$HOME/.zprezto" && {
    ln -s ./prezto $HOME/.zprezto
}

REPOS_DIR=$(cd $(dirname $0); pwd)

for rcfile in $(ls prezto/runcoms/ | grep -v README); do
    SRC="${REPOS_DIR}/prezto/runcoms/$rcfile"
    DST="${HOME}/.${rcfile}"
    check_overwrite $DST && {
        ln -s $SRC $DST
    }
done

check_overwrite "$HOME/.tmux.conf" && {
    ln -s $CWD/tmux/tmux.conf $HOME/.tmux.conf
}

check_overwrite "$HOME/.gitconfig" && {
    ln -s $CWD/gitconfig $HOME/.gitconfig
}


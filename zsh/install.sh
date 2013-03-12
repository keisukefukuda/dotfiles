#!/bin/sh

DIR=`dirname $0`
DIR=`cd ${DIR}; pwd`

# backup current .emacs file
if [ -f "${HOME}/.bashrc" ]; then
    echo -n "Backup and replace ~/.bashrc ? [y/N]: "
    read ANS
    if [ "${ANS}" = 'y' -o "${ANS}" = 'Y' ]; then
        mv ${HOME}/.bashrc ${HOME}/.bashrc.bak
    else
        exit
    fi
fi

ln -s ${DIR}/bashrc ${HOME}/.bashrc
ln -s ${DIR}/zshrc  ${HOME}/.zshrc


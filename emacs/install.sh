#!/bin/sh

DIR=`dirname $0`
DIR=`cd ${DIR}; pwd`

# backup current .emacs file
if [ -f "${HOME}/.emacs" ]; then
    echo -n "Backup and replace ~/.emacs ? [y/N]: "
    read ANS
    if [ "${ANS}" = 'y' -o "${ANS}" = 'Y' ]; then
        mv ${HOME}/.emacs ${HOME}/.emacs.bak
    fi
fi

cat <<EOF >${HOME}/.emacs
(load "${DIR}/emacs.el")
EOF

emacs -nw --script "${DIR}/install.el"

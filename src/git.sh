#!/bin/bash

echo "Installing git"

sudo apt install -f git git-lfs tig vim
git config --global core.editor "vim"
git config --global core.autocrlf input
git config --global pull.rebase true
git config --global rebase.autoStash true
tee -a ~/.bashrc << EOM
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
EOM

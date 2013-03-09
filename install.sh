#!/bin/bash

sDir=$(cd $(dirname "$0"); pwd)
cd $sDir

# required packages
req="make links exuberant-ctags"

# only install gvim if we're in a gui environment
if [ -z $DISPLAY ]
then
    req="vim-nox $req"
else
    req="vim-gnome $req"
fi

updated=0
for r in $req
do
    if ! dpkg -s "$r" > /dev/null
    then
        echo "Installing $r..."
        if [ $updated -eq 0 ]
        then
            sudo apt-get update
        fi
        updated=1
        sudo apt-get install -y "$r"
        echo "...installed $r"
    else
        echo "$r already installed"
    fi
done

echo "backing up existing vim config..."
mv $HOME/.vimrc $HOME/.vimrc.backup
mv $HOME/.vim $HOME/.vim.backup

echo "linking to new vim config..."
ln -f -s -T $sDir/vim $HOME/.vim
ln -s -f $sDir/vimrc $HOME/.vimrc

git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

$sDir/update.sh

echo "vim config installed. huzzah!"


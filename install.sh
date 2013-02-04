#!/bin/bash

sDir=$(cd $(dirname "$0"); pwd)
echo "script found at:" $sDir
cd $sDir

sudo apt-get update

# only install gvim if we're in a gui environment
if [ -z $DISPLAY ]
then
    sudo apt-get install vim-nox
else
    sudo apt-get install vim-gnome
fi

sudo apt-get install make

echo "installing ctags"
sudo apt-get install exuberant-ctags

echo "backing up existing vim config..."
mv ~/.vimrc ~/.vimrc.backup
mv ~/.vim ~/.vim.backup

echo "linking to new vim config..."
ln -f -s -T $sDir/vim ~/.vim
ln -s -f $sDir/vimrc ~/.vimrc

echo "vim config installed. huzzah!"

echo "installing links to get php help..."
sudo apt-get install links

./update.sh

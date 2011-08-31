#!/bin/bash

sudo apt-get install vim-gnome

sDir=$(cd $(dirname "$0"); pwd)
echo "script found at:" $sDir

echo "installing ctags"
sudo apt-get update
sudo apt-get install ctags

echo "backing up existing vim config..."
mv ~/.vimrc ~/.vimrc.backup
mv ~/.vim ~/.vim.backup

echo "linking to new vim config..."
ln -s $sDir/vim ~/.vim
ln -s $sDir/vimrc ~/.vimrc

echo "vim config installed. huzzah!"

oldDir=$(pwd)
cd $sDir/lib/command-t
./install-commant-t.sh
cd $oldDir

echo "installing links to get php help..."
sudo apt-get install links

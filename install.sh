#!/bin/bash

sDir=$(cd $(dirname "$0"); pwd)
echo "script found at:" $sDir
cd $sDir

sudo apt-get install vim-gnome

echo "installing ctags"
sudo apt-get update
sudo apt-get install ctags

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

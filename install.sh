#!/bin/bash
sDir=$(cd $(dirname "$0"); pwd)
echo "script found at:" $sDir

echo "backing up existing vim config..."
mv ~/.vimrc ~/.vimrc.backup
mv ~/.vim ~/.vim.backup

echo "linking to new vim config..."
ln -s $sDir/vim ~/.vim
ln -s $sDir/vimrc ~/.vimrc

echo "vim config installed. huzzah!"


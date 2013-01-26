#!/bin/bash

sDir=$(cd $(dirname "$0"); pwd)
echo "script found at:" $sDir
cd $sDir

git submodule update --init --recursive

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

echo "Installing pathogen..."
if ! ln -f -s $sDir/lib/vim-pathogen/autoload/pathogen.vim $sDir/vim/autoload/pathogen.vim
then
    echo "Failed to install pathogen!"
    exit 1
fi
echo "...installed pathogen"

oldDir=$(pwd)
cd $sDir/vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
cd $oldDir

echo "Installing drupal-vimrc..."
if ! ln -f -s $sDir/lib/drupal_vimrc/bundle/vim-plugin-for-drupal $sDir/vim/bundle
then
    echo "... failed!"
else
    echo "...installed drupal-vimrc"
fi



echo "installing links to get php help..."
sudo apt-get install links

#!/bin/bash
sDir=$(cd $(dirname "$0"); pwd)
cd $sDir

cd $sDir/vim

# vundle install happens by simply loading vim, so only
# run the update scripts if it's already installed, else
# will try to do a BundleInstall twice (which is slow)
if [ -d $sDir/vim/bundle ]
then
    vim +BundleClean! +qall
    vim +BundleInstall! +qall
else
    vim +qall
fi

cd $sDir

cd $sDir/vim/bundle/Command-T/ruby/command-t
ruby extconf.rb
make


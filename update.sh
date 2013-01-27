#!/bin/bash
sDir=$(cd $(dirname "$0"); pwd)
cd $sDir

cd $sDir/vim
vim +BundleClean! +qall
vim +BundleInstall! +qall
cd $sDir

cd $sDir/vim/bundle/Command-T/ruby/command-t
ruby extconf.rb
make


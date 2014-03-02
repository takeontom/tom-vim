#!/bin/bash
sDir=$(cd $(dirname "$0"); pwd)

cd $sDir/vim/bundle/jedi-vim
git submodule update --init --recursive


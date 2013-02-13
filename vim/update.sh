#!/bin/bash
sDir=$(cd $(dirname "$0"); pwd)
cd $sDir

# vundle will install itself and all its bundles automatically if it's
# not installed yet
if [ ! -d $sDir/bundle ]
then
    vim +qall
else
    vim +BundleClean! +qall
    vim +BundleInstall! +qall

    $sDir/post-update.sh
fi


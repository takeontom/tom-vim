#!/bin/bash
sDir=$(cd $(dirname "$0"); pwd)

cd $sDir/vim/bundle/Command-T/ruby/command-t
ruby1.8 extconf.rb
make


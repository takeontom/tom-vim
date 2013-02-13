#!/bin/bash
sDir=$(cd $(dirname "$0"); pwd)

cd $sDir/bundle/Command-T/ruby/command-t
ruby extconf.rb
make


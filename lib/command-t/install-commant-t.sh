#!/bin/bash

sudo apt-get install ruby ruby-dev

vim -c ":so%" command-t-1.0.vba

cd ~/.vim/ruby/command-t
ruby extconf.rb
make

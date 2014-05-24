#!/bin/bash
sDir=$(cd $(dirname "$0"); pwd)

mkdir ~/bin
curl http://beyondgrep.com/ack-2.12-single-file > /tmp/ack
sudo mv /tmp/ack /usr/bin/ack
sudo chmod 0755 /usr/bin/ack

sudo mkdir -p /usr/share/fonts/opentype
sudo wget -O /usr/share/fonts/opentype/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
sudo fc-cache -f
sudo wget -O /etc/fonts/conf.d/10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf


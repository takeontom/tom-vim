#!/bin/bash
sDir=$(cd $(dirname "$0"); pwd)

mkdir ~/bin
curl http://beyondgrep.com/ack-2.12-single-file > /tmp/ack
sudo mv /tmp/ack /usr/bin/ack
sudo chmod 0755 /usr/bin/ack

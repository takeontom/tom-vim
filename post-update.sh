#!/bin/bash
sDir=$(cd $(dirname "$0"); pwd)

curl http://beyondgrep.com/ack-2.12-single-file > ~/bin/ack && chmod 0755 ~/bin/ack

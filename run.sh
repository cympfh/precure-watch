#!/bin/sh

trap "kill -TERM -$$" SIGINT

: >/tmp/tw
bash server.sh &
stdbuf -o L bash filter.sh | tee /tmp/tw
# firefox http://127.0.0.1:8080/
wait

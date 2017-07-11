#!/bin/bash

PORT=${1:-8080}
N=${2:-20}
M=${3:-1}

rm -f /tmp/f; mkfifo /tmp/f
trap "rm -f /tmp/f; exit" INT

run() {
    head -1 > /tmp/req
    if ( grep "^GET /media" /tmp/req >/dev/null ); then

        DUMMY=http://i.imgur.com/zLit1WQr.png
        (
            yes "$DUMMY" | head -n "$M";
            </tmp/tw grep "^M " | sed 's/^M //g'
        ) | tail -n "$M"

    elif ( grep "^GET /tw" /tmp/req >/dev/null ); then

        </tmp/tw grep "^T" | grep -v "RT" | tail -n "$N" | sed 's/^T //g'

    else

        echo "HTTP/1.1 200 OK"; echo
        cat index.html

    fi
}

echo "running on http://127.0.0.1:$PORT/"
while :; do
    cat /tmp/f | run | nc -l 127.0.0.1 $PORT > /tmp/f
done

#!/bin/bash

PORT=8080

rm -f /tmp/f; mkfifo /tmp/f
trap "rm -f /tmp/f; exit" INT

run() {
  head -1 > /tmp/req
  if ( grep "^GET /media" /tmp/req >/dev/null ); then

    MEDIA=$( </tmp/tw grep '^M' | tail -n 1 )
    if [ "_$MEDIA" = "_" ]; then
      echo "http://cympfh.cc/neta/img/CcQjPZvUkAARb64.jpg" # dummy file
    else
      echo ${MEDIA} | sed 's/^M //g'
    fi

  elif ( grep "^GET /tw" /tmp/req >/dev/null ); then

    </tmp/tw grep "^T" | grep -v "RT" | tail -n 20 | sed 's/^T //g'

  else

    echo "HTTP/1.1 200 OK"; echo
    cat index.html

  fi
}

echo running on http://127.0.0.1:$PORT/
while :; do
  cat /tmp/f | run | nc -l 127.0.0.1 $PORT > /tmp/f
done

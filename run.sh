#!/bin/sh

usage() {
  cat << USAGE
SYNOPSIS: $0 [-t <track-word>] [-p <port>] [-n <tweet-num>] [-m <photo-num>]
USAGE
  exit
}

T="#precure"
P=8080
N=20
M=1

while [ "_$1" != "_" ]; do
  case $1 in
    -t )
      T=$2
      shift 2
      ;;
    -p )
      P=$2
      shift 2
      ;;
    -n )
      N=$2
      shift 2
      ;;
    -m )
      M=$2
      shift 2
      ;;
    * )
      usage
      ;;
  esac
done

trap "kill -TERM -$$" SIGINT
: >/tmp/tw
bash server.sh "$P" "$N" "$M" &
stdbuf -o L bash filter.sh "$T" | tee /tmp/tw
# firefox http://127.0.0.1:8080/
wait

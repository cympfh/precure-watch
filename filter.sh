#!/bin/bash

Q=${1:-#precure}
twurl -t -d "track=${Q}" -A 'Accept-Encoding: text' -H userstream.twitter.com /1.1/statuses/filter.json 2>/dev/null |
jq --unbuffered -r '(if has("text") then "T " + (.text|gsub("\n";" ")) else "" end) + "\n" + (if has("entities") then (.entities | if has("media") then .media | map("M " + .media_url) | join("\n") else "" end ) else "" end)' |
grep --line-buffered -v RT |
grep --line-buffered '...'

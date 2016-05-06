#!/bin/bash

Q="#precure"
twurl -t -d track=$Q -A 'Accept-Encoding: text' -H userstream.twitter.com /1.1/statuses/filter.json 2>/dev/null |
jq --unbuffered -r '(if has("text") then "T " + .text else "" end) + "\n" + (if has ("media") then (.media | map(.media_url) | map("M " + .) | join("\n") ) else "" end)'

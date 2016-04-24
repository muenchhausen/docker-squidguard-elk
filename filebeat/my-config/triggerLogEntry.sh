#!/bin/bash

for try in {1..10} ; do
  # try any invalid url - just for getting a access log entry
  curl "http://squidguard:3128/startupTest${try}.html" > /dev/null
  if [ $? -eq 0 ]; then 
    break
  fi
  sleep 5
done

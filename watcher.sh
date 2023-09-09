#!/bin/sh

while inotifywait -e modify ./src; do
  ELM_FILES=$(find ./src -name '*.elm')
  echo "Watching $ELM_FILES"
  elm make $ELM_FILES
done

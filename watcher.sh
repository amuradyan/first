#!/bin/sh

while inotifywait -e modify ./src ./tests; do
  ELM_FILES=$(find ./src -name '*.elm')

  echo "Watching $ELM_FILES"
  elm make $ELM_FILES && elm-test
done

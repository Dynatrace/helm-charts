#!/usr/bin/env bash

for directory in "$(pwd)"/*/; do

  cd "$directory/" || exit 5
  if [ -f "Chart.yml" ] || [ -f "Chart.yaml" ]; then
    echo "Unit-testing $directory"

    if ! helm unittest --helm3 . ; then
      echo "some tests failed in directory '$directory'"
      exit 10
    fi
  else
    echo "$directory does not contain Chart file. skipping..."
  fi
done

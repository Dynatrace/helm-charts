#!/usr/bin/env bash

for directory in "$(pwd)"/*/; do

  if [[ -d "$directory/chart/default" ]]; then
    cd "$directory/chart/default" || exit 5
    if [ -f "Chart.yml" ] || [ -f "Chart.yaml" ]; then
      echo "Linting $directory"

      if ! helm template --debug --set oneagent.apiUrl="test-url",apiUrl="test-url",secret.apiToken="test-token",secret.paasToken="test-token",apiToken="test-token",paasToken="test-token" .; then
        echo "could not parse template. something is wrong with template files of directory '$directory'"
        exit 10
      fi

      if ! helm lint --debug --set oneagent.apiUrl="test-url",secret.apiToken="test-token",secret.paasToken="test-token",apiToken="test-token",paasToken="test-token" . ; then
        echo "linter returned with error. check yaml formatting in files of directory '$directory'." && exit 15
      fi
    else
      echo "$directory does not contain Chart file. skipping..."
    fi
  fi
done
#!/usr/bin/env bash

for directory in "$(pwd)"/*/; do

  if [[ -d "$directory/chart/default" ]]; then
    cd "$directory/chart/default" || exit 5
    if [ -f "Chart.yml" ] || [ -f "Chart.yaml" ]; then
      echo "Linting $directory"

    if ! helm template --debug --set oneagent.apiUrl="test-url" --set apiUrl="test-url" --set secret.apiToken="test-token" --set secret.paasToken="test-token" --set apiToken="test-token" --set paasToken="test-token"  .; then
      echo "could not parse template. something is wrong with template files of directory '$directory'"
      exit 10
    fi

    if ! helm template --debug --set oneagent.apiUrl="test-url"  --set secret.apiToken="test-token" --set secret.paasToken="test-token"  --set apiToken="test-token" --set paasToken="test-token" . | yamllint -d "{extends: default, rules: {line-length: disable, trailing-spaces: disable}}" --strict -; then
       echo "linter returned with error. check yaml formatting in files of directory '$directory'." && exit 15
    fi
  fi
done
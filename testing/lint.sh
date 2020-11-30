#!/usr/bin/env bash

for file in "$(pwd)"/*/; do

  cd "$file/" || exit 5
  if [ -f "Chart.yml" ] || [ -f "Chart.yaml" ]; then
    echo "Linting $file"

    if ! helm template --debug --set oneagent.apiUrl="test-url" .; then
      echo "could not parse template. something is wrong with template files of directory '$file'"
      exit 10
    fi

    if ! helm template --debug --set oneagent.apiUrl="test-url" . | yamllint --strict -; then
       echo "linter returned with error. check yaml formatting in files of directory '$file'." && exit 15
    fi
  else
    echo "$file does not contain Chart file"
  fi
done

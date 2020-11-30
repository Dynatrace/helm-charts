#!/usr/bin/env bash

for file in "$(pwd)"/*/; do

  cd "$file/" || exit 5
  if [ -f "Chart.yml" ] || [ -f "Chart.yaml" ]; then
    echo "Linting $file"
    helm template --debug --set oneagent.apiUrl="test-url" . || exit 10
    helm template --debug --set oneagent.apiUrl="test-uel" . | yamllint --strict - || exit 15
  else
    echo "$file does not contain Chart file"
  fi
done

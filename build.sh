#!/bin/bash

lint=1
build=1
scan=1
run=1

set -e

lang=$1
image=$(echo "hello-$lang" | tr '[:upper:]' '[:lower:]')

if [ -n "$lint" ]
then
  echo "### Linting code"
  touch "$(pwd)/super-linter.log"
  docker run --name "$image-super-lint" \
    --rm \
    -e LOG_LEVEL=WARN \
    -e RUN_LOCAL=true \
    -e USE_FIND_ALGORITHM=true \
    -v "$(pwd)/$lang:/tmp/lint" \
    -v "$(pwd)/super-linter.log:/tmp/lint/super-linter.log" \
    -v "$(pwd)/.linters:/tmp/lint/.github/linters" \
    github/super-linter

  # Clean linting artifacts
  docker run --name "$image-clean" \
    --rm \
    -v "$(pwd)/$lang:/tmp/app" \
    busybox:latest \
    rm -rf \
      /tmp/app/.github \
      /tmp/app/super-linter.log \
      /tmp/app/.mypy_cache \
      /tmp/app/target \
      /tmp/app/Cargo.lock
fi

if [ -n "$build" ]
then

  echo "### Building image"
  docker build "$lang" -t "$image" || exit 1

  if [ -n "$scan" ]
  then
    echo "### Scanning image"
    trivy -o "./trivy.log" image --ignore-unfixed "$image"
  fi

  if [ -n "$run" ]
  then
    echo "### Running container"
    docker run --rm --name "$image-smoke" "$image"
  fi

fi

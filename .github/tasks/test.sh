#!/usr/bin/env bash

set -eux

function main() {
  echo "${STEP}"
  echo "${PRODUCT}"
  echo "hello world"
}

main "$@"
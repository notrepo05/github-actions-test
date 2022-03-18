#!/usr/bin/env bash

set -eux

function main() {
  echo "${STEP}"
  echo "tas: ${PUBLISH_TAS}"
  echo "ist: ${PUBLISH_IST}"
  echo "tasw: ${PUBLISH_TASW}"
  echo "hello world"
  echo "::set-output name=products::[\"tas\", \"ist\"]"
  echo "::set-output name=step::publish"
}

main "$@"
#!/usr/bin/env bash

set -eux

function main() {
  echo "${STEP}"

  local scenarios
  scenarios='[]'
  local supported_scenarios
  supported_scenarios=""
  if [[ "${PUBLISH_TAS}" == true ]]; then
    supported_scenarios+="tas"
  fi
  if [[ "${PUBLISH_IST}" == true ]]; then
    supported_scenarios+=" ist"
  fi
  if [[ "${PUBLISH_TASW}" == true ]]; then
    supported_scenarios+=" tasw"
  fi

  echo "supported_scenarios"
  for scenario in $supported_scenarios; do
    senarios=$(jq --arg scenarios "${scenarios}" '. += [$scenarios]' <<< "${scenario}")
  done
  echo $scenarios

  echo "tas: ${PUBLISH_TAS}"
  echo "ist: ${PUBLISH_IST}"
  echo "tasw: ${PUBLISH_TASW}"
  echo "hello world"
  echo "::set-output name=products::$(jq -c "." <<< "${scenarios}")"
  echo "::set-output name=step::${STEP}"
}

main "$@"
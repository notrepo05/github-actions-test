#!/usr/bin/env bash

set -eux

function main() {
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

  for scenario in $supported_scenarios; do
    scenarios=$(echo $scenarios | jq --arg key1 $scenario -c '. += [$key1]')
  done

  sleep 60

  echo "::set-output name=products::$(jq -c "." <<< "${scenarios}")"
  echo "::set-output name=step::${STEP}"
}

main "$@"
#!/bin/sh

set -eu

[ ! -e /tmp/build/* ] || cd /tmp/build/*

REM () {
  /bin/echo $( date -u +"%Y-%m-%dT%H:%M:%SZ" ) "$@"
}

fatal () {
  echo "FATAL: $1" >&2
  exit 1
}

repipe () {
  exec 3>&1
  exec 1>&2
  cat > /tmp/stdin
}

load_source () {
  eval $( jq -r '{
    "source_gcp_json_key": .source.gcp_json_key,
    "source_region": .source.region,
    "source_project": .source.project,
    "source_platform": .source.platform,
    "source_service_name": .source.service_name
    } | to_entries[] | .key + "=" + @sh "\(.value)"
  ' < /tmp/stdin )
}

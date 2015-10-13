#!/bin/bash
set -exvo pipefail

SELF=$(basename "$0")
APP="${APP_NAME}"


function e              { echo "[$SELF]" "$@"; }
function debug          { [[ -z "$DEBUG" ]] || e "$@"; }
function error          { e "$@" >&2; }
function death          { error "$@"; exit 1; }

[[ -n "$DOCKER_BUILD" ]] \
    || death "This script is intended for use by the Dockerfile and not as a way to build locally"

# masterless
mkdir -p /etc/salt/minion.d
cat > /etc/salt/minion.d/masterless.conf <<EOF
file_client: local
state_output: mixed
file_roots:
  base:
    - /app/states
    - /app/salt
    - /app/salt/_formulae/salt-states
pillar_roots:
  base:
    - /app/pillar
EOF

# prep
mkdir -p /app/$APP

# highstate
salt-call state.highstate -l info --retcode-passthrough

# cleanup
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

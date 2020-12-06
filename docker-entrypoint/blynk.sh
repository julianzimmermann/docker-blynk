#!/bin/bash
set -e

export ESC="$"

envsubst < /etc/blynk/config/server.properties.template > "$BLYNK_CONFIG_FOLDER"/server.properties

exec "$@"
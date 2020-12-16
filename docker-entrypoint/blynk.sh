#!/bin/bash
set -e

export ESC="$"

if [ ! -d "$BLYNK_FOLDER" ]; then
    mkdir -p "$BLYNK_FOLDER"
fi

if [ ! -d "$BLYNK_DATA_FOLDER" ]; then
    mkdir -p "$BLYNK_DATA_FOLDER"
fi

if [ ! -d "$BLYNK_CONFIG_FOLDER" ]; then
    mkdir -p "$BLYNK_CONFIG_FOLDER"
fi

if [ ! -d "$BLYNK_LOG_FOLDER" ]; then
    mkdir -p "$BLYNK_LOG_FOLDER"
fi

blynkFileName=${BLYNK_DOWNLOAD_URL##*/}

if [ ! -f "$BLYNK_FOLDER"/"$blynkFileName" ]; then
    cd "$BLYNK_FOLDER"
    if ! wget "$BLYNK_DOWNLOAD_URL"; then
        echo "ERROR: can't get $BLYNK_DOWNLOAD_URL" >&2
        exit 1
    fi
    cd ..
fi

envsubst < /etc/blynk/config/server.properties.template > "$BLYNK_CONFIG_FOLDER"/server.properties
envsubst < /etc/blynk/config/mail.properties.template > "$BLYNK_FOLDER"/mail.properties

nohup java -jar "$BLYNK_FOLDER"/"$blynkFileName" -dataFolder "$BLYNK_DATA_FOLDER" -serverConfig "$BLYNK_CONFIG_FOLDER"/server.properties

exec "$@"
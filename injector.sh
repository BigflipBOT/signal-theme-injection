#!/bin/bash

TEMP=$(mktemp -d)
SIGNAL_DIR="/usr/lib/signal-desktop/resources"
NAME=$1

asar e "${SIGNAL_DIR}/app.asar" ${TEMP}

cp ${NAME} "${TEMP}/stylesheets/$(basename ${NAME})" 

sed -i "1i @import \"${NAME}\";" "${TEMP}/stylesheets/manifest.css"

sudo asar p ${TEMP} "${SIGNAL_DIR}/app.asar"

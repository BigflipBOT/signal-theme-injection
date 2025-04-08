#!/bin/bash

temp=$(mktemp -d)
signal_dir="/usr/lib/signal-desktop/resources"
path=$1
name=$(basename ${path})

asar e "${signal_dir}/app.asar" ${temp}

cp ${path} "${temp}/stylesheets/${name}" 

sed -i "2i @import \"${name}\";" "${temp}/stylesheets/manifest.css"

sudo asar p ${temp} "${signal_dir}/app.asar"

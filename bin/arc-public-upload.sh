#!/bin/bash

if [ -z "$1" ]
  then
    echo "No file found."
    exit 1
fi

s3cmd -c ~/.s3cfg-exo-ng put --acl-public $1 s3://sos-ch-gva-2 | grep http | sed "s/Public URL of the object is: http/https/g"

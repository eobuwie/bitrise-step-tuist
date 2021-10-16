#!/bin/bash
set -ex

TUIST_VERSION=$(cat ${tuist_version_file})

curl -LSs --output /tmp/tuistenv.zip https://github.com/tuist/tuist/releases/download/${TUIST_VERSION}/tuistenv.zip
unzip -o /tmp/tuistenv.zip -d /tmp/tuistenv > /dev/null

if [[ ! -d "/usr/local/bin" ]]; then
  mkdir -p /usr/local/bin/
fi

if [[ -f "/usr/local/bin/tuist" ]]; then
  rm /usr/local/bin/tuist
fi

mv /tmp/tuistenv/tuistenv /usr/local/bin/tuist
chmod +x /usr/local/bin/tuist

rm -rf /tmp/tuistenv
rm /tmp/tuistenv.zip

tuist generate

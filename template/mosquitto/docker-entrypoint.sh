#!/bin/ash

set -e

if ( [ -z "${MOSQUITTO_USERNAME}" ] || [ -z "${MOSQUITTO_PASSWORD}" ] ); then
  echo "MOSQUITTO_USERNAME or MOSQUITTO_PASSWORD not defined"
  exit 1
fi

# create mosquitto passwordfile
touch /mosquitto/config/mosquitto.passwd
mosquitto_passwd -b /mosquitto/config/mosquitto.passwd $MOSQUITTO_USERNAME $MOSQUITTO_PASSWORD

exec "$@"
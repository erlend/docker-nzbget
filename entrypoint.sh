#! /bin/sh
set -e

[ ! -f /data/nzbget.conf ] && cp /nzbget/nzbget.conf /data/nzbget.conf

if [ -z "$1" ] || [ "${1:0:1}" = "-" ]; then
  set -- dumb-init /nzbget/nzbget -c /data/nzbget.conf -o outputmode=log -s $@
fi

exec $@

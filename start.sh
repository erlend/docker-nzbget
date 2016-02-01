#! /bin/sh

set -e

[ ! -f /data/nzbget.conf ] && cp /nzbget/nzbget.conf /data/nzbget.conf
[ ! -f /data/nzbget.log ] && touch /data/nzbget.log

/nzbget/nzbget --configfile /data/nzbget.conf --daemon
tail -f /data/nzbget.log

#!/bin/sh

set -e

rm -f /tmp/iptables.rules
/usr/sbin/iptables-save | tee /tmp/iptables.rules > /dev/null
/usr/sbin/nft "$@"
/usr/sbin/iptables-restore < /tmp/iptables.rules

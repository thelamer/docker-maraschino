#!/bin/bash

[[ ! -d "/app/maraschino/.git" ]] && /sbin/setuser abc git clone https://github.com/mrkipling/maraschino.git /app/maraschino



# opt out for autoupdates
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /app/maraschino
/sbin/setuser abc git pull

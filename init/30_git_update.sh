#!/bin/bash

if [ ! -d "/app/maraschino/.git" ]; then
/sbin/setuser abc git clone https://github.com/mrkipling/maraschino.git /app/maraschino
else
cd /app/maraschino
/sbin/setuser abc git pull
fi

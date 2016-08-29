FROM lsiobase/alpine.python

MAINTAINER smdion <me@seandion.com>

# add local files
COPY root/ /

# ports and volumes
EXPOSE 7000
VOLUME /config


FROM lsiobase/alpine.python:3.5
MAINTAINER smdion <me@seandion.com>

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# add local files
COPY root/ /

# ports and volumes
EXPOSE 7000
VOLUME /config


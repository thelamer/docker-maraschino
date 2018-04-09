FROM lsiobase/alpine.python:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
ARG MARASCHINO_COMMIT
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

RUN \
echo "**** install build packages ****" && \
apk add --no-cache --virtual=build-dependencies \
 curl \
 curl-dev && \
 echo "**** install app ****" && \
 mkdir -p \
	/app/maraschino && \
 curl -o \
 /tmp/maraschino.tar.gz -L \
	"https://github.com/mrkipling/maraschino/archive/${MARASCHINO_COMMIT}.tar.gz" && \
 tar xf \
 /tmp/maraschino.tar.gz -C \
	/app/maraschino --strip-components=1 && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/tmp/*
# add local files
COPY root/ /

# ports and volumes
EXPOSE 7000
VOLUME /config

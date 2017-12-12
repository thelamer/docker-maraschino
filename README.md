[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/
[appurl]: http://www.maraschinoproject.com/
[hub]: https://hub.docker.com/r/linuxserver/maraschino/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/maraschino
[![](https://images.microbadger.com/badges/version/linuxserver/maraschino.svg)](https://microbadger.com/images/linuxserver/maraschino "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/linuxserver/maraschino.svg)](https://microbadger.com/images/linuxserver/maraschino "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/maraschino.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/maraschino.svg)][hub][![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Builders/x86-64/x86-64-maraschino)](https://ci.linuxserver.io/job/Docker-Builders/job/x86-64/job/x86-64-maraschino/)

Maraschino, a simple web interface to act as a nice overview/front page for my XBMC HTPC.

[![maraschino](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/maraschino.png)][appurl]

## Usage

```
docker create \
--name=maraschino \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 7000:7000 \
linuxserver/maraschino
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 7000` - the port(s)
* `-v /config` - where maraschino should store its configuration files.
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it maraschino /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

The webui is found at port 7000.


## Info

* To monitor the logs of the container in realtime `docker logs -f maraschino`.

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' maraschino`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/maraschino`

## Versions

+ **12.12.17:** Rebase to alpine 3.7.
+ **21.07.17:** Internal git pull instead of at runtime.
+ **25.05.17:** Rebase to alpine 3.6.
+ **07.02.17:** Rebase to alpine 3.5.
+ **14.10.16:** Add version layer information.
+ **10.09.16:** Add layer badge to README.
+ **29.08.16:** Rebase to alpine.
+ **09.11.15:** Initial Release.

#!/bin/sh

apk add --no-cache tzdata

cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime && echo "Europe/Zurich" > /etc/timezone

docker-entrypoint.sh directus start
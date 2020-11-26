#!/bin/sh

APP_NAME=hello-app
docker build -t "$APP_NAME":1.0 .
if [ "$(docker ps -a | grep "$APP_NAME" -c)" = 1 ]; then
  docker rm -f "$APP_NAME"
fi
docker run -d --rm --name "$APP_NAME" -p 8080:8080 "$APP_NAME":1.0

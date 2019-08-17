#!/bin/bash

DIR=$(dirname "$0")

if [ ! "$(docker ps -a | grep nail-studio__postgres)" ]; then 
	echo 'nail-studio__postgres builds'
	docker build -t nail-studio__postgres $DIR/../database -f $DIR/postgres/Dockerfile
	docker run --name nail-studio__postgres --publish 5432:5432 --detach nail-studio__postgres
	echo 'nail-studio__postgres built'
fi

if [ ! "$(docker ps | grep nail-studio__postgres)" ]; then
	echo 'nail-studio__postgres starts'
	docker start nail-studio__postgres
	if [ "$(docker ps | grep nail-studio__postgres)" ]; then
		echo 'nail-studio__postgres is running'
	fi
fi

#!/bin/bash

version_tag="$(date '+%Y%m%d')"
set -x
docker build -t agiledigital/postfix:latest $@ .
docker tag agiledigital/postfix:latest "agiledigital/postfix:$version_tag"

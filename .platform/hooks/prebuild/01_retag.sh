#!/usr/bin/env bash
# Find the one image EB just built (aws_beanstalk/<something>-app:latest)
IMAGE=$(docker images --format '{{.Repository}}:{{.Tag}}' \
       | grep '^aws_beanstalk/.*-app:latest' | head -n1)

if [ -n "$IMAGE" ]; then
  echo "Retagging $IMAGE → aws_beanstalk/current-app:latest"
  docker tag "$IMAGE" aws_beanstalk/current-app:latest
else
  echo "⛔️ No aws_beanstalk/*-app:latest image found to retag!"
  exit 1
fi
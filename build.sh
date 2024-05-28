#!/bin/bash
docker rm -f miniature-dollop 
docker image rm -f miniature-dollop
docker build --tag miniature-dollop -f Dockerfile . 
docker run -p 4000:4000 --rm --name=miniature-dollop miniature-dollop 
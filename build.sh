#!/bin/bash
docker rm -f miniature-dollop 
docker image rm -f miniature-dollop
docker build --tag miniature-dollop -f Dockerfile .
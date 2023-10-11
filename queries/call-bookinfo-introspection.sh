#!/bin/sh

curl -v -X POST -H 'Content-Type: application/json' http://graphql.api.example.com/bookinfo-graphql \
  -d '{"query":"{__typename}"}}'
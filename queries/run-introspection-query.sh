#!/bin/sh

curl -d "$(./convert-graphql-query-to-json.sh introspection-query.graphql)" -H "Content-Type: application/json" http://api.example.com/bookinfo-graphql
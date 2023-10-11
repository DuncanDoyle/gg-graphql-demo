#!/bin/sh

export QUERY="query MyProductsForHome { productsForHome { title } }"
export QUERY_ENCODED=$(python -c "import urllib, sys; print urllib.quote(sys.argv[1])" "$QUERY")
# Use "printf '%s'" instead of "echo -n", as the output of echo in this script is inconsistent with the output in terminal.
export QUERY_SHA256=$(printf '%s' "$QUERY" | shasum -a 256 | head -c 64)

export URL=http://graphql.api.example.com/bookinfo-graphql 

curl --get $URL \
    -d "query=$QUERY_ENCODED" \
    --data-urlencode "extensions={\"persistedQuery\":{\"version\":1,\"sha256Hash\":\"$QUERY_SHA256\"}}"
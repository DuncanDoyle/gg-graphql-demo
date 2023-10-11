#!/bin/sh

# Check that an argument has been passed.
if [ -z "$1" ]
then
   echo "Please pass your GraphQL query file to convert."
   exit 1
fi

# Check if the passed in file exists.
if [ ! -f $1 ]; then
    echo "File not found!"
fi

graphqlquery=$(cat $1)

jq -c -n --arg query "
$graphqlquery
" '{"query":$query}'
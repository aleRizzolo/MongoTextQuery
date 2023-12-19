#!/bin/bash

ROOT_DIR=$(pwd)

docker network create --driver bridge mongotextsearch

# we make sure that we have js files
cd server/
npm install
npm run build

docker build -t mongotextsearch-server .
clear

# cd $ROOT_DIR/client
# docker build -t mongotextsearch-client .
# clear

cd $ROOT_DIR

read -p "Do you want to start the application? Yy/Nn: " answer

case $answer in 
    Y | y ) echo docker run --rm -d --network mongotextsearch -p 3000:3000 --name mongotextsearch-server mongotextsearch-server;;
    N | n  ) exit 0;;
    *     ) echo "Invalid choice";;
esac
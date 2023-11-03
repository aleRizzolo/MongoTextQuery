#!/bin/bash

ROOT_DIR=$(pwd)

# we make sure that we have js files
cd server/
npm install
npm run build

docker build -t mongotextsearch-server .
clear

cd $ROOT_DIR/client
docker build -t mongotextsearch-client .
clear

cd $ROOT_DIR

read -p "Do you want to start the backend container? y/n: " answer

if [ $answer = "y" ]
then
    docker run --rm -d -p 3000:3000 --name mongotextsearch-be mongotextsearch-be
else
    return 0
fi
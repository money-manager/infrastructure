#!/bin/bash

declare -A REPOSITORIES_ADDR=(
  [fincon-service]="https://github.com/money-manager/fincon-service"
  [client]="https://github.com/money-manager/client"
)


# creates a "services" directory if it doesn't exist
if [ ! -d ./services ]
then
  mkdir services
fi


# clone/fetch repositories from "REPOSITORIES_ADDR" array
for REPOSITORY_NAME in "${!REPOSITORIES_ADDR[@]}";
do
  LOCAL_PATH_TO_REPO="./services/$REPOSITORY_NAME"

  if [ ! -d $LOCAL_PATH_TO_REPO ]
  then
    echo -e "clonning \"$REPOSITORY_NAME\" from ${REPOSITORIES_ADDR[$REPOSITORY_NAME]}";
    git clone ${REPOSITORIES_ADDR[$REPOSITORY_NAME]} $LOCAL_PATH_TO_REPO;
  else
    echo -e "pull \"$REPOSITORY_NAME\" from ${REPOSITORIES_ADDR[$REPOSITORY_NAME]}";
    git -C $LOCAL_PATH_TO_REPO pull --all;
  fi
done

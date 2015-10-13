#!/bin/bash

set -x
set -e

function build_docker() {
    if [[ "$1" == "test" ]]
    then
        ## build test env
        BUILD_ENV=test docker build -f Dockerfile-base -t ${APP_NAME}-base-test .
        BUILD_ENV=test docker build -f Dockerfile-test -t ${APP_NAME}-test .
    else
        ## build dev env
        docker build -f Dockerfile-base -t ${APP_NAME}-base .
        docker build -f Dockerfile -t ${APP_NAME}-dev .
    fi
}

function run_docker() {
    if [[ "$1" == "test" ]]
    then
        BUILD_ENV=test docker-compose -f docker-compose.test.yml build
        BUILD_ENV=test docker-compose -f docker-compose.test.yml run app test
    else
        docker-compose -f docker-compose.yml build
        docker-compose -f docker-compose.yml run app shell
    fi
}

export APP_NAME="{{ cookiecutter.repo_name }}"
CMD=$1

if [[ "$CMD" == "--test" || "$CMD" == "-t" ]]
then
    echo "RUNNING TEST"
    build_docker test
    run_docker test
else
    build_docker
    run_docker
fi


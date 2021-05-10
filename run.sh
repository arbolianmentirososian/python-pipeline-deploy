#!/usr/bin/env bash

CURRENT_DIR=$(dirname $(readlink -f $0))
TCP_SERVER_PORT=8082
WORKERS_NUM=5
THREADS_PER_WORKER=2

cd ${CURRENT_DIR}/src && gunicorn --workers=${WORKERS_NUM} --threads=${THREADS_PER_WORKER} -b 0.0.0.0:${TCP_SERVER_PORT} main:app
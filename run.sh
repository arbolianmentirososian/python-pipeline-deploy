#!/usr/bin/env bash

TCP_SERVER_PORT=8080
WORKERS_NUM=5
THREADS_PER_WORKER=2

gunicorn --workers=${WORKERS_NUM} --threads=${THREADS_PER_WORKER} -b 0.0.0.0:${TCP_SERVER_PORT} main:app
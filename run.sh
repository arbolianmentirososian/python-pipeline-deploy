#!/usr/bin/env bash

function set_workers_number() {
  local workers=5
  if [[ -x "$(command -v nproc)" ]]; then
    cores_num=$(nproc)
    if ((cores_num > 2)); then
      workers=$((2 * cores_num + 1))
    fi
  fi
  echo ${workers}
}

CURRENT_DIR=$(dirname $(readlink -f $0))
TCP_SERVER_PORT=55555
WORKERS_NUM=$(set_workers_number)
THREADS_PER_WORKER=2

source "${CURRENT_DIR}/venv/bin/activate"

RESULT=$?

if [[ ${RESULT} -eq 0 ]]; then
  printf "virtual env created successfully\n"
  cd ${CURRENT_DIR} && gunicorn --workers=${WORKERS_NUM} --threads=${THREADS_PER_WORKER} -b 0.0.0.0:${TCP_SERVER_PORT} main:app
else
  printf "could not start virtual env\n"
fi

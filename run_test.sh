#!/usr/bin/env bash

CURRENT_DIR=$(dirname $(readlink -f $0))

/usr/bin/python3 -m venv venv

source "${CURRENT_DIR}/venv/bin/activate"

pip install -r requirements.txt

RESULT=$?

if [[ ${RESULT} -eq 0 ]]; then
  printf "virtual env created successfully\n"
  pytest --cov=src --cov=test --cov-report=xml:test/coverage.xml --junitxml=test/results.xml
else 
  printf "could not start virtual env\n"
fi

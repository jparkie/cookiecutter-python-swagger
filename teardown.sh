#!/bin/bash

set -e

#
# Functions:
#

function echo_info() {
	echo "[cookiecutter-python-swagger] INFO teardown.sh - $1" >&1
}

function echo_error() {
	echo "[cookiecutter-python-swagger] ERROR teardown.sh - $1" >&1
}

#
# Constants:
#

DIR="$(cd "$(dirname "$0")"; pwd -P)"

#
# Step 1:
#

echo_info "Deleting {{cookiecutter.project}}"
rm -rf "${DIR}/{{cookiecutter.project}}"

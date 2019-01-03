#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

#
# Functions:
#

function echo_info() {
	echo "[cookiecutter-python-swagger] INFO pre_gen_project.sh - $1" >&1
}

function echo_error() {
	echo "[cookiecutter-python-swagger] ERROR pre_gen_project.sh - $1" >&1
}

#
# Checks:
#

if [[ ! $(command -v docker) ]]; then
	echo_error "Requires Docker"
	exit 1
fi

#
# Step 1:
#

echo_info "Copying {{cookiecutter.swagger_json_file}}"
cp "{{cookiecutter.swagger_json_file}}" "./swagger.json"

#
# Done:
#

echo_info "Done!"

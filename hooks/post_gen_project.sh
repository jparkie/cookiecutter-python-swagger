#!/bin/bash

set -e

#
# Functions:
#

function echo_info() {
	echo "[cookiecutter-python-swagger] INFO post_gen_project.sh - $1" >&1
}

function echo_error() {
	echo "[cookiecutter-python-swagger] ERROR post_gen_project.sh - $1" >&1
}

#
# Step 1:
#

echo_info "Initializing Git"
git init
git add .
git commit -n -m "Initial Commit"

#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

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
# Constants:
#

DIR="$(cd "$(dirname "$(pwd -P)")"; pwd -P)"
EXCLUDES=(
	"./.dockerignore"
	"./.gitignore"
	"./.travis.yml"
	"./Dockerfile"
	"./git_push.sh"
	"./README.md"
	"./requirements.txt"
	"./setup.py"
	"./test-requirements.txt"
	"./tox.ini"
	)
INCLUDES=(
	"./includes/.dockerignore"
	"./includes/.gitignore"
	"./includes/.pre-commit-config.yaml"
	"./includes/CHANGES"
	"./includes/Dockerfile"
	"./includes/Dockerfile.develop"
	"./includes/Jenkinsfile"
	"./includes/Makefile"
	"./includes/README.md"
	"./includes/requirements-dev.txt"
	"./includes/requirements.txt"
	"./includes/setup.py"
	"./includes/tox.ini"
	)

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

echo_info "Pulling swaggerapi/swagger-codegen-cli"
docker pull swaggerapi/swagger-codegen-cli:v2.3.1

#
# Step 2:
#

echo_info "Generating {{cookiecutter.project}} with swaggerapi/swagger-codegen-cli"
docker run \
	--volume "${DIR}":/root \
	swaggerapi/swagger-codegen-cli:v2.3.1 generate \
	-c /root/"{{cookiecutter.project}}"/temps/swagger_config.json \
	-i /root/"{{cookiecutter.project}}"/swagger.json \
	-o /root/"{{cookiecutter.project}}" \
	-l python-flask

#
# Step 3:
#

echo_info "Excluding files"
for file in "${EXCLUDES[@]}"; do
	echo_info "Excluding file ${file}"
	rm "${file}"
done

#
# Step 4:
#

echo_info "Including files"
for file in "${INCLUDES[@]}"; do
	echo_info "Including file ${file}"
	cp -R "${file}" "./"
done

#
# Step 5:
#

echo_info "Removing includes/"
rm -rf "./includes"

#
# Step 6:
#

echo_info "Removing temps/"
rm -rf "./temps"

#
# Step 7:
#

echo_info "Initializing Git"
git init
git add .
git commit -n -m "Initial Commit"

#
# Done:
#

echo_info "Done!"

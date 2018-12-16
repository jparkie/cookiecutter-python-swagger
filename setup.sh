#!/bin/bash

set -e

#
# Functions:
#

function echo_info() {
	echo "[cookiecutter-python-swagger] INFO setup.sh - $1" >&1
}

function echo_error() {
	echo "[cookiecutter-python-swagger] ERROR setup.sh - $1" >&1
}

#
# Constants:
#

DIR="$(cd "$(dirname "$0")"; pwd -P)"
EXCLUDES=(
	"${DIR}/{{cookiecutter.project}}/.dockerignore"
	"${DIR}/{{cookiecutter.project}}/.gitignore"
	"${DIR}/{{cookiecutter.project}}/.travis.yml"
	"${DIR}/{{cookiecutter.project}}/Dockerfile"
	"${DIR}/{{cookiecutter.project}}/git_push.sh"
	"${DIR}/{{cookiecutter.project}}/README.md"
	"${DIR}/{{cookiecutter.project}}/requirements.txt"
	"${DIR}/{{cookiecutter.project}}/setup.py"
	"${DIR}/{{cookiecutter.project}}/test-requirements.txt"
	"${DIR}/{{cookiecutter.project}}/tox.ini"
	)
INCLUDES=(
	"${DIR}/includes/.dockerignore"
	"${DIR}/includes/.gitignore"
	"${DIR}/includes/.pre-commit-config.yaml"
	"${DIR}/includes/CHANGES"
	"${DIR}/includes/Dockerfile"
	"${DIR}/includes/Dockerfile.develop"
	"${DIR}/includes/Jenkinsfile"
	"${DIR}/includes/Makefile"
	"${DIR}/includes/README.md"
	"${DIR}/includes/requirements-dev.txt"
	"${DIR}/includes/requirements.txt"
	"${DIR}/includes/setup.py"
	"${DIR}/includes/tox.ini"
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
	-c /root/swagger_config.json \
	-i /root/swagger.json \
	-o /root/"{{cookiecutter.project}}" \
	-l python-flask

#
# Step 3:
#

echo_info "Renaming files with proper cookiecutter tags"
for file in $(find "${DIR}/{{cookiecutter.project}}" -depth -name "*cookiecutter_*"); do
	echo_info "Renaming file ${file}"
	mv "${file}" "$(echo ${file} | sed 's/cookiecutter_/cookiecutter./g')"
done

#
# Step 4:
#

echo_info "Editing files with proper cookiecutter tags"
for file in $(find "${DIR}/{{cookiecutter.project}}" -type f); do
	echo_info "Editing file ${file}"
	sed -i "" -e "s/cookiecutter_/cookiecutter./g" "${file}"
done

#
# Step 5:
#

echo_info "Excluding files"
for file in "${EXCLUDES[@]}"; do
	echo_info "Excluding file ${file}"
	rm "${file}"
done

#
# Step 6:
#

echo_info "Including files"
for file in "${INCLUDES[@]}"; do
	echo_info "Including file ${file}"
	cp -R "${file}" "${DIR}/{{cookiecutter.project}}"
done

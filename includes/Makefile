PYTHON_ARGS =

TEST_ARGS = 

DOCKER_BASE = docker run \
	--volume $$(pwd):/repository \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--publish 8080:8080

DOCKER_RUN = $(DOCKER_BASE) \
	cookiecutter_py36_python_swagger

DOCKER_INTERACTIVE = $(DOCKER_BASE) \
	--interactive \
	--tty \
	--entrypoint bash \
	cookiecutter_py36_python_swagger

.docker/cookiecutter_py36_python_swagger: Dockerfile.develop
	docker build --tag cookiecutter_py36_python_swagger --file Dockerfile.develop .
	mkdir -p .docker
	touch .docker/cookiecutter_py36_python_swagger

help:
	@echo "Welcome to {{cookiecutter.project}}!"
	@echo ""
	@echo "This project is preferably managed with Docker. Please have Docker installed."
	@echo ""
	@echo "    uninstall-docker"
	@echo "        Remove Docker image cookiecutter_py36_python_swagger"
	@echo "    init-hooks"
	@echo "        Initialize project hooks"
	@echo "    init"
	@echo "        Initialize project directory"
	@echo "    interactive"
	@echo "        Start an interactive, Dockerized bash session"
	@echo "    python PYTHON_ARGS=\"--version\""
	@echo "        Execute Python within a Docker container"
	@echo "    run"
	@echo "        Run the Python project"
	@echo "    test TEST_ARGS=\"*\""
	@echo "        Test the Python project"
	@echo "    pre-commit"
	@echo "        Execute pre-commit hooks"
	@echo "        See https://pre-commit.com/ for more information"
	@echo "    clean"
	@echo "        Clean the Python project"

uninstall-docker:
	rm -rf .docker
	docker rmi --force cookiecutter_py36_python_swagger

init-hooks:
	curl https://pre-commit.com/install-local.py | python -
	$(HOME)/bin/pre-commit install

init: .docker/cookiecutter_py36_python_swagger
	$(DOCKER_RUN) tox -e venv

interactive: .docker/cookiecutter_py36_python_swagger
	$(DOCKER_INTERACTIVE)	

python: .docker/cookiecutter_py36_python_swagger
	$(DOCKER_RUN) /repository/venv/bin/python3 $(PYTHON_ARGS)

run: .docker/cookiecutter_py36_python_swagger
	$(DOCKER_RUN) /repository/venv/bin/python3 -m {{cookiecutter.project}}

test: .docker/cookiecutter_py36_python_swagger
	$(DOCKER_RUN) tox -- $(TEST_ARGS)

pre-commit:
	$(HOME)/bin/pre-commit run --all-files

clean:
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete
	rm -rf .tox
	rm -rf venv

.PHONY: help uninstall-docker init-hooks init interactive python run test pre-commit clean

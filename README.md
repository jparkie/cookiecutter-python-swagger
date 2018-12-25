# cookiecutter-python-swagger

Cookiecutter template for a Swagger-generated Python server stub.

## Requirements

### cookiecutter

Please follow instructions at https://cookiecutter.readthedocs.io/en/latest/installation.html.

#### pip

```
pip install cookiecutter
```

#### Homebrew (macOS)

```
brew install cookiecutter
```
#### Ubuntu

```
sudo apt-get install cookiecutter
```

## Installation

Please execute the following command to create a new Swagger-generated Python server stub.

```
cookiecutter git@github.com:jparkie/cookiecutter-python-swagger.git
```

### Configurations

```
> cookiecutter git@github.com:jparkie/cookiecutter-python-swagger.git
swagger_json_file [../swagger.json]:
project [example]:
version [0.1.0]:
description [N/A]:
author_email [N/A]:
```

## Features

### Dockerfile + Makefile + Jenkinsfile

- A Dockerfile.develop with Python 3.6.7, tox, and tox-venv is provided to self-contain the project.
- A Dockerfile is provided to deploy the Swagger-generated Python server stub.
- A Makefile is provided to execute various project commands within a Docker container.
- A Jenkinsfile is provided with the following stages: Checkout, Clean, and Unit Test.

#### Makefile

```
> make help
Welcome to {{cookiecutter.project}}!

This project is preferably managed with Docker. Please have Docker installed.

    uninstall-docker
        Remove Docker image cookiecutter_py36_python_swagger
    init-hooks
        Initialize project hooks
    init
        Initialize project directory
    interactive
        Start an interactive, Dockerized bash session
    python PYTHON_ARGS="--version"
        Execute Python within a Docker container
    run
        Run the Python project
    test TEST_ARGS="*"
        Test the Python project
    pre-commit
        Execute pre-commit hooks
        See https://pre-commit.com/ for more information
    clean
        Clean the Python project
```

### Project Structure

```
> tree -a ./
./
├── .dockerignore
├── .gitignore
├── .pre-commit-config.yaml
├── .swagger-codegen
│   └── VERSION
├── .swagger-codegen-ignore
├── CHANGES
├── Dockerfile
├── Dockerfile.develop
├── Jenkinsfile
├── Makefile
├── README.md
├── requirements-dev.txt
├── requirements.txt
├── setup.py
├── swagger.json
├── tox.ini
└── {{cookiecutter.project}}
    ├── __init__.py
    ├── __main__.py
    ├── controllers
    │   ├── __init__.py
    │   ├── pet_controller.py
    │   ├── store_controller.py
    │   └── user_controller.py
    ├── encoder.py
    ├── models
    │   ├── __init__.py
    │   ├── api_response.py
    │   ├── base_model_.py
    │   ├── category.py
    │   ├── order.py
    │   ├── pet.py
    │   ├── tag.py
    │   └── user.py
    ├── swagger
    │   └── swagger.yaml
    ├── test
    │   ├── __init__.py
    │   ├── test_pet_controller.py
    │   ├── test_store_controller.py
    │   └── test_user_controller.py
    └── util.py

6 directories, 36 files
```

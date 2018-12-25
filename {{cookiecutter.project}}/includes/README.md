# {{cookiecutter.project}}

{{cookiecutter.description}}

## Makefile

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

## Configuration Files

- [`Dockerfile`](https://docs.docker.com/engine/reference/builder/) - Configures a Docker container used to deploy the web server
- [`Dockerfile.develop`](https://docs.docker.com/engine/reference/builder/) - Configures for Docker container used for development
- [`Jenkinsfile`](https://jenkins.io/doc/book/pipeline/jenkinsfile/) - Configures the continuous integration process
- [`Makefile`](https://www.gnu.org/software/make/) - Simplifies various project management processes into `make` targets
- [`requirements.txt`](https://pip.pypa.io/en/stable/user_guide/) - List of dependencies for running the web server
- [`requirements-dev.txt`](https://pip.pypa.io/en/stable/user_guide/) - List of dependencies for developing the web server
- [`tox.ini`](https://tox.readthedocs.io/en/latest/) - Configures and builds a consistent environment for continuous integration and coverage checks

## Contact

**Email**: [{{cookiecutter.author_email}}](mailto:{{cookiecutter.author_email}})

## Credits

This package was created with [Cookiecutter](https://github.com/audreyr/cookiecutter) and the [jparkie/cookiecutter-python-swagger](https://github.com/jparkie/cookiecutter-python-swagger) project template.

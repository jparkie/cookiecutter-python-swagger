FROM python:3-alpine

LABEL maintainer="jparkie <https://github.com/jparkie>"
LABEL description="A Docker image used for building cookiecutter-python-swagger projects"

# Setup Application Directory:
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy Dependencies:
COPY requirements.txt /usr/src/app/

# Install Dependencies:
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy Application:
COPY . /usr/src/app

# Expose 8080 for HTTP:
EXPOSE 8080

# Launch Application:
ENTRYPOINT ["python3"]

CMD ["-m", "{{cookiecutter.project}}"]

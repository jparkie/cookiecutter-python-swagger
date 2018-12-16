# coding: utf-8

import sys
from setuptools import setup, find_packages

NAME = "{{cookiecutter.project}}"
VERSION = "{{cookiecutter.version}}"

# To install the library, run the following
#
# python setup.py install
#
# prerequisite: setuptools
# http://pypi.python.org/pypi/setuptools

REQUIRES = ["connexion", "python_dateutil"]

setup(
    name=NAME,
    version=VERSION,
    description="{{cookiecutter.description}}",
    author_email="{{cookiecutter.author_email}}",
    url="",
    install_requires=REQUIRES,
    packages=find_packages(),
    package_data={'': ['swagger/swagger.yaml']},
    include_package_data=True,
    entry_points={
        'console_scripts': ['{{cookiecutter.project}}={{cookiecutter.project}}.__main__:main']}
)

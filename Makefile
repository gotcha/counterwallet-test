VIRTUALENV=virtualenv-2.7

all: bin/pybot

bin/python:
	$(VIRTUALENV) .

bootstrap.py:
	wget https://bootstrap.pypa.io/bootstrap-buildout.py -O $@

bin/buildout: bin/python bootstrap.py
	bin/python bootstrap.py --version=2.3.1 --setuptools-version=12.1

bin/pybot: bin/buildout buildout.cfg
	bin/buildout -Nvt 5

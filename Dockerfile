FROM python:3.8-buster

ENV PYTHONUNBUFFERED 1
ARG REQUIREMENT_FILE

RUN apt update

RUN mkdir /code
WORKDIR /code

COPY $REQUIREMENT_FILE /code/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /code/requirements.txt

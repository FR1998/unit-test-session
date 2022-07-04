FROM python:3.8-buster

ENV PYTHONUNBUFFERED 1
ARG REQUIREMENT_FILE
ARG USER

RUN useradd -rm -d /home/$USER -s /bin/bash -g root -G sudo -u 1001 $USER
RUN apt update && apt install git -y
USER $USER

RUN mkdir /home/$USER/code
WORKDIR /home/$USER/code

COPY $REQUIREMENT_FILE /home/$USER/code/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /home/$USER/code/requirements.txt

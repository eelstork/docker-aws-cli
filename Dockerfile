FROM ubuntu:16.04
MAINTAINER Tea, tea.desouza@gmail.com

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y tzdata locales

# Set the locale for UTF-8 support
RUN echo en_US.UTF-8 UTF-8 >> /etc/locale.gen && \
    locale-gen && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Needed for AWS CLIs to handle UTF-8 correctly:
ENV PYTHONIOENCODING=UTF-8

# AWS EB CLI with Python 3
RUN apt-get install -y python3-pip
RUN pip3 install awsebcli --upgrade --user


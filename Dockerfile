FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  apt update && \
  apt install -y apt-transport-https ca-certificates && \
  echo "deb https://packages.red-data-tools.org/ubuntu/ bionic universe" > \
    /etc/apt/sources.list.d/red-data-tools.list && \
  apt update --allow-insecure-repositories && \
  apt install -y --allow-unauthenticated red-data-tools-keyring && \
  apt update

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle install

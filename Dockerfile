FROM docker.io/library/debian:stretch

ENV DEBIAN_FRONTEND noninteractive

# Copy in apt.conf and sources.list
COPY files/. /

RUN apt-get update
RUN apt-get install wget apt-utils locales

# Put a locale in place which understands UTF8
RUN locale-gen C.UTF-8 && update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

FROM docker.io/library/debian:stretch

ENV DEBIAN_FRONTEND noninteractive

# Copy in apt.conf and sources.list
COPY files/etc/apt/. /etc/apt
COPY files/root/. /root

RUN apt-get update
RUN apt-get install apt-utils locales

# Put a locale in place which understands UTF8
RUN locale-gen C.UTF-8 && update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

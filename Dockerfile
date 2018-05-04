FROM docker.io/library/ubuntu:bionic
COPY .stamp /

ENV DEBIAN_FRONTEND noninteractive

# Copy in apt.conf and sources.list
COPY files/etc/apt/. /etc/apt
COPY files/root/. /root

RUN apt-get update
RUN apt-get install apt-utils locales

# Put a locale in place which understands UTF8;
# for some reason "C.UTF-8" doesn't work on Ubuntu like it does Debian.
RUN locale-gen en_CA.UTF-8 && update-locale LANG=en_CA.UTF-8
ENV LANG en_CA.UTF-8
ENV LC_ALL en_CA.UTF-8

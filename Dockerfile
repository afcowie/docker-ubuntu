FROM debian:jessie
MAINTAINER Andrew Cowie <andrew@operationaldynamics.com>

ENV DEBIAN_FRONTEND noninteractive
ADD apt/apt.conf /etc/apt/apt.conf
ADD apt/sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install wget apt-utils locales

# Put a locale in place which understands UTF8
RUN locale-gen C.UTF-8 && update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

FROM debian:jessie
MAINTAINER Andrew Cowie <andrew@operationaldynamics.com>

ENV DEBIAN_FRONTEND noninteractive
ADD apt/apt.conf /etc/apt/apt.conf
ADD apt/sources.list /etc/apt/sources.list

# This is utterly horrid. I wish docker supported injecting environment
# variables. But it doesn't, so we have no choice but to set it here.
ENV http_proxy  http://10.42.149.1:8123/
ENV https_proxy http://10.42.149.1:8123/

RUN apt-get update
RUN apt-get install wget apt-utils locales

# Put a locale in place which understands UTF8
RUN locale-gen C.UTF-8 && update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

## Base Image
FROM ubuntu:18.04

## Install Prerequirements
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install --yes \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Install KiCad
ARG KICAD_PPA="kicad/kicad-5.1-releases"
RUN add-apt-repository --yes ppa:$KICAD_PPA \
    && apt-get update \
    && apt-get install --yes --install-recommends \
    kicad \
    kicad-locale-ja \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Language Support
RUN apt-get update \
    && apt-get install --yes \
    fonts-ipafont \
    language-pack-ja \
    language-pack-ja-base \
    locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8

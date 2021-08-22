#!/bin/sh

## Runtime Option
set -xe

## Navigate to this script directory
cd $(dirname $0)

## Build
docker build --tag kicad:5 --build-arg KICAD_PPA="kicad/kicad-5.1-releases" .

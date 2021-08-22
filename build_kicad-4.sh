#!/bin/sh

## Runtime Option
set -xe

## Navigate to this script directory
cd $(dirname $0)

## Build
docker build --tag kicad:4 --build-arg KICAD_PPA="js-reynaud/kicad-4" .

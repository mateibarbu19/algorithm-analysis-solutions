#!/bin/bash

if [ -d res ]; then
    pushd res
    make "$1"
    popd
fi

#!/bin/sh

# script path
script=$(
    cd -- "$(
        dirname -- "${BASH_SOURCE[0]}"
    )" &>/dev/null && pwd
)

cd $script

# add git submodules
bash submodules.sh

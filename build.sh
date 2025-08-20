#!/bin/sh

# script path
script=$(
    cd -- "$(
        dirname -- "${BASH_SOURCE[0]}"
    )" &>/dev/null && pwd
)

cd $script

mkdir /home/Cao/github/df/lib/DataFrame/Release
cd /home/Cao/github/df/lib/DataFrame/Release

# Making the optimized release version
cmake -DCMAKE_BUILD_TYPE=Release -DHMDF_BENCHMARKS=0 -DHMDF_EXAMPLES=0 -DHMDF_TESTING=0 ..

#!/bin/bash

IN=$1
OUT=$2
FILE=$(basename ${IN})
SYM="${FILE%.*}"

COMPILER=extern/scheme48/ps-compiler/ps-compiler.image

if [ -f "$COMPILER" ]; then
    scheme48 -i ${COMPILER} <<EOF
    (prescheme-compiler '${SYM} '("${IN}") '${SYM}-init "${OUT}")
    ,exit    
EOF
    echo
else
    echo "Unable to find ${COMPILER}"
    exit -1
    
fi

#!/bin/bash

IN=$1
OUT=$2

SYM="${IN%.*}"

COMPILER=ps-compiler.image

if [ -f "$COMPILER" ]; then
    scheme48 -i ${COMPILER} <<EOF
    (prescheme-compiler '${SYM} '("${IN}") '${SYM}-init "${OUT}")
    ,exit    
EOF
    echo
else
    echo "Unable to find ${COMPILER}"
    return -1
    
fi

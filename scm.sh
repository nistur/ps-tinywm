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


readarray -t DEPS <<< "$(cat ${IN} | grep  "(files" |  sed -e 's/[[:space:]]*(files \(.*\)))/\1.scm/g')"

echo -n "${OUT}: " > ${OUT}.d
for i in "${DEPS[@]}" ; do
    echo -n "src/${i} " >> ${OUT}.d
done

echo >> ${OUT}.d
echo >> ${OUT}.d
for i in "${DEPS[@]}" ; do
    echo "src/${i}:" >> ${OUT}.d
    echo >> ${OUT}.d
done

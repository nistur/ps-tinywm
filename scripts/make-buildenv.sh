#!/bin/bash

pushd extern/scheme48
./configure
make
cd ps-compiler
../scheme48 <<EOF
,config ,load ../scheme/prescheme/interface.scm
,config ,load ../scheme/prescheme/package-defs.scm
,exec ,load load-ps-compiler.scm
,in prescheme-compiler prescheme-compiler
,user (define prescheme-compiler ##)
,dump ps-compiler.image "(Pre-Scheme)"
,exit
EOF
echo
popd

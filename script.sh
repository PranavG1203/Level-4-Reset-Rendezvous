#!/bin/bash

if [ ! -f FLAG.txt ]; then
    exit 1
fi

flag=$(tr -d '[:space:]' < FLAG.txt)

expected_hash="ce63dea9d7628e8f455471c788008f294755242195196785746cac4a8cc26d14"

student_hash=$(echo -n "$flag" | sha256sum | awk '{ print $1 }')

if [[ "$student_hash" == "$expected_hash" ]]; then
    echo "Pass!"
    exit 0
else
    echo "Fail!"
    exit 1
fi

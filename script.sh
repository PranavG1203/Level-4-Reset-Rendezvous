#!/bin/bash

# Check if the FLAG.txt file exists
if [ ! -f FLAG.txt ]; then
    echo "Fail! FLAG.txt not found."
    exit 1
fi

# Read the flag and remove whitespace
flag=$(tr -d '[:space:]' < FLAG.txt)

# Define the expected SHA256 hash
expected_hash="ce63dea9d7628e8f455471c788008f294755242195196785746cac4a8cc26d14"

# Compute the SHA256 hash of the student's flag
student_hash=$(echo -n "$flag" | sha256sum | awk '{ print $1 }')

# Compare the hashes
if [[ "$student_hash" == "$expected_hash" ]]; then
    echo "Pass!"
    exit 0
else
    echo "Fail!"
    exit 1
fi

#!/usr/bin/env bash 

for FILE in $(ls -1 *.cr | sed -e 's/\.cr$//')
do
    echo "Building $FILE"
    crystal build $FILE.cr --release -o ~/bin/$FILE
done

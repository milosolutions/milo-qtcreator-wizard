#!/bin/bash
MODULES=$(ls -d ../../packages/*/)

for MODULE in $MODULES
do
    filename=$(basename -- "$MODULE")
    extension="${filename##*.}"
    echo "$filename"
    echo "$extension"
done

cat header.in > wizard.json
cat options.in >> wizard.json
cat pages.in >> wizard.json
echo     \"generators\": [] >> wizard.json
echo } >> wizard.json

#!/bin/bash
MODULES=$(ls -d ../../packages/*/)


checkboxes=""
for MODULE in $MODULES
do
    filename=$(basename -- "$MODULE")
    moduleName="${filename##*.}"
    #echo "$filename"
    checkboxes="$checkboxes"\n$(sed -e "s;%moduleName%;$moduleName;g" checkbox.in)
done
echo "$checkboxes"
cat header.in > wizard.json
cat options.in >> wizard.json
cat pages.in >> wizard.json
echo     \"generators\": [] >> wizard.json
echo } >> wizard.json

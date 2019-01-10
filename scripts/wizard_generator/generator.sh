#!/bin/bash

#MODULES=$(ls -d ../../packages/*/)
MODULES=(\
../../packages/com.milosolutions.mbarcodescanner/ \
../../packages/com.milosolutions.mcharts/ \
../../packages/com.milosolutions.mconfig/ \
../../packages/com.milosolutions.mcrypto/ \
../../packages/com.milosolutions.mlog/ \
../../packages/com.milosolutions.mrestapi/ \
../../packages/com.milosolutions.mscripts/ \
../../packages/com.milosolutions.msentry/ \
)


#for MODULE in $MODULES



cat header.in        > wizard.json
cat options.in      >> wizard.json
cat pages1.in       >> wizard.json

echo {} >> wizard.json
for MODULE in ${MODULES[*]}
do
    filename=$(basename -- "$MODULE")
    moduleName="${filename##*.}"
    echo , >> wizard.json
    sed -e "s;%moduleName%;$moduleName;g" checkbox.in >> wizard.json
done

cat pages2.in       >> wizard.json

echo     \"generators\": [ {} >> wizard.json

for MODULE in ${MODULES[*]}
do
    filename=$(basename -- "$MODULE")
    moduleName="${filename##*.}"

    module_files=$(find $MODULE -type f -not -path '*/\.g*' -not -path '*/meta/*')
    for modfile in $module_files
    do
        prefix="$MODULE"data/milo/
        target=${modfile#"$prefix"}
        echo , >> wizard.json
        sed \
            -e "s;%MODULENAME%;$moduleName;g" \
            -e "s;%SOURCE%;$modfile;g"\
            -e "s;%TARGET%;$target;g"\
            file_generator.in >> wizard.json
    done
done

echo ] >> wizard.json
echo } >> wizard.json

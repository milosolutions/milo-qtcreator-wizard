#!/bin/bash

#MODULES=$(ls -d ../../packages/*/)
MODULES=(\
./packages/com.milosolutions.mbarcodescanner/ \
./packages/com.milosolutions.mcharts/ \
./packages/com.milosolutions.mconfig/ \
./packages/com.milosolutions.mcrypto/ \
./packages/com.milosolutions.mlog/ \
./packages/com.milosolutions.mrestapi/ \
./packages/com.milosolutions.mscripts/ \
./packages/com.milosolutions.msentry/ \
)


#for MODULE in $MODULES



cat ./scripts/wizard_generator/header.in 
cat ./scripts/wizard_generator/options.in     

cat ./scripts/wizard_generator/pages1.in      
for MODULE in ${MODULES[*]}
do
    filename=$(basename -- "$MODULE")
    moduleName="${filename##*.}"
    echo ,
    sed -e "s;%moduleName%;$moduleName;g" ./scripts/wizard_generator/checkbox.in
done
cat ./scripts/wizard_generator/pages2.in      

cat ./scripts/wizard_generator/generators1.in
for MODULE in ${MODULES[*]}
do
    filename=$(basename -- "$MODULE")
    moduleName="${filename##*.}"

    module_files=$(find $MODULE -type f -not -path '*/\.g*' -not -path '*/meta/*')
    for modfile in $module_files
    do
        prefix="$MODULE"data/milo/
        target=milo/${modfile#"$prefix"}
        echo ,
        sed \
            -e "s;%MODULENAME%;$moduleName;g" \
            -e "s;%SOURCE%;$modfile;g"\
            -e "s;%TARGET%;$target;g"\
            ./scripts/wizard_generator/file_generator.in
    done
done
cat ./scripts/wizard_generator/generators2.in

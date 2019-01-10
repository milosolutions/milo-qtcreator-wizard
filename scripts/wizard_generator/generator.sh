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



cat header.in 
cat options.in     

cat pages1.in      
for MODULE in ${MODULES[*]}
do
    filename=$(basename -- "$MODULE")
    moduleName="${filename##*.}"
    echo ,
    sed -e "s;%moduleName%;$moduleName;g" checkbox.in
done
cat pages2.in      

cat generators1.in
for MODULE in ${MODULES[*]}
do
    filename=$(basename -- "$MODULE")
    moduleName="${filename##*.}"

    module_files=$(find $MODULE -type f -not -path '*/\.g*' -not -path '*/meta/*')
    for modfile in $module_files
    do
        prefix="$MODULE"data/milo/
        target=${modfile#"$prefix"}
        echo ,
        sed \
            -e "s;%MODULENAME%;$moduleName;g" \
            -e "s;%SOURCE%;$modfile;g"\
            -e "s;%TARGET%;$target;g"\
            file_generator.in
    done
done
cat generators2.in

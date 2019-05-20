#!/bin/bash

# Purpose of this script is to generate wizard.json body (template project for Qt Creator).
# Output is directed to stdout

# In modules variable we store simple modules which will be delivered as they are (whitout template substitution)
#MODULES=$(ls -d ../../packages/*/)
MODULES=(\
packages/mbarcodescanner/ \
packages/mcharts/ \
packages/mconfig/ \
packages/mcrypto/ \
packages/mlog/ \
packages/mrestapi/ \
packages/mscripts/ \
packages/msentry/ \
packages/msshtunnel/ \
packages/memailsystem/ \
packages/mcalendar/ \
)

# modules that should be checked as default in wizard
DEFAULT=(mlog mconfig mscripts)

# Takes path to module directory and returns its full name
# (e.g. com.milosolutions.mbarcodescanner)
getFullModuleName() {
  echo $(basename -- "$1")
}

# gets module name (e.g. msentry) from full name
getModuleName() {
    fullname=$(getFullModuleName $1)
    echo "${fullname##*.}"
}

isDefault() {
    for item in ${DEFAULT[*]}
    do
        if [ "$item" == "$1" ]
        then
            echo true
            return
        fi
    done
    echo false
}

# prints header which contains wizard meta-info and also project description, icon and so on..
cat ./scripts/wizard_generator/header.in 
# options contains calculated string used for substitutions (like ProjectName)
cat ./scripts/wizard_generator/options.in     

# pages1.in defines pages visible when wizard is run (like choose kit, choose project path)
cat ./scripts/wizard_generator/pages1.in      
# create CheckBoxes for 'Choose modules' Page
for MODULE in ${MODULES[*]}
do
    moduleName=$(getModuleName $MODULE)
    echo ,
    # generate CheckBox entry from template, substituting module name
    checked=$(isDefault $moduleName)
    sed \
        -e "s;%moduleName%;$moduleName;g" \
        -e "s;%checked%;$checked;g"\
        ./scripts/wizard_generator/checkbox.in
done
# finishing pages section
cat ./scripts/wizard_generator/pages2.in      

# generators are copying files from source to projects destination folder
cat ./scripts/wizard_generator/generators1.in
for MODULE in ${MODULES[*]}
do
    moduleName=$(getModuleName $MODULE)
    # gets all files from module, except:
    # - files related with git (.git, .gitingore, ...)
    # - files inside meta directory
    module_files=$(find $MODULE -type f -not -path '*/\.git' -not -path '*/meta/*')
    for modfile in $module_files
    do
        prefix=packages/
        #change prefix from modfile to "milo/" 
        target=milo/${modfile#"$prefix"}
        echo ,
        # creates file generator body
        sed \
            -e "s;%MODULENAME%;$moduleName;g" \
            -e "s;%SOURCE%;$modfile;g"\
            -e "s;%TARGET%;$target;g"\
            ./scripts/wizard_generator/file_generator.in
    done
done
# finishes generators section and whole wizard
cat ./scripts/wizard_generator/generators2.in

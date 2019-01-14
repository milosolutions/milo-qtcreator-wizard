#!/bin/bash

# Bail on errors.
set -e

if [ "${1}" = "-h" ] || [ "${1}" = "--help" ]; then
  echo "Usage: $(basename $0) extension qtIfwPath [doxygenPath]"
  echo "This will only work when invoked from root repo dir"
  echo
  echo "Milo DB installer"
  exit
fi

if [ $# -lt 2 ]; then
  echo "Illegal number of parameters: "$#". See --help"
  exit 1
fi

EXTENSION=$1
IFW=$2
DOXY=$3

if [ ! -f "$IFW" ]; then
  echo "Qt Installer Framework has not been found! "$IFW
  exit 3
fi

# if [ ! -f "$DOXY" ]; then
#   echo "Doxygen has not been found. No worries, this script will still continue "$DOXY
# fi

TEMP_DIR=$(mktemp -d)
CONTENT_DIR=$TEMP_DIR/packages/com.milosolutions
cp -r scripts/wizard_generator/config $TEMP_DIR/config

mkdir -p $CONTENT_DIR
cp -r packages $CONTENT_DIR/data
cp -r scripts/wizard_generator/meta $CONTENT_DIR/meta/
./generator.sh > $CONTENT_DIR/data/wizard.json
cp ./icon.png $CONTENT_DIR/data/icon.png

OUTPUT=miloWizardinstaller_$(date +%Y.%m.%d).$EXTENSION
echo "Building installer"
$IFW -v -c $TEMP_DIR/config/config.xml -p $TEMP_DIR/packages build/$OUTPUT

chmod +x ./build/$OUTPUT

rm -r $TEMP_DIR

echo "Done! Installer was created here: build/$OUTPUT"

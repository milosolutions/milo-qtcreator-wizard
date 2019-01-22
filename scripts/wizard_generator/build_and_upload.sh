#!/bin/bash
OUTPUT=./build/miloWizardInstaller_$(date +%Y.%m.%d).run
DOMAIN=https://seafile.milosolutions.com
REPO=$MILOCODEDATABASE_SEAFILE_REPO
./scripts/wizard_generator/create_installer.sh $OUTPUT /home/tools/Qt-OpenSource/Tools/QtInstallerFramework/3.0/bin/binarycreator
./scripts/upload_to_seafile.sh -f $OUTPUT -s $DOMAIN -r $REPO -t $SEAFILE_TOKEN
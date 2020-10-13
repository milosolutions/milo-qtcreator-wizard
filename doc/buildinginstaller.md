Building installer
===

# CI builds # {#ci-build}

Milo GitLab CI is set up to generate Milo Wizard installer,
[online documentation](https://docs.milosolutions.com/milo-code-db/main/) and
the installers for Windows and Linux automatically for each new commit.

You can see the available installers
[here](https://seafile.milosolutions.com/d/2c50614e1e/).

# Creating an installer manually # {#manually-build}

This repository can easily be compiled into an installer using:

```
./scripts/wizard_generator/generator.sh > wizard.json
./scripts/wizard_generator/create_installer.sh output_installer_file.run <QtIfwInstallationDir>/bin/binarycreator
```

or (on Windows)

```
scripts\wizard_generator\create_win_installer.bat output_installer_file.exe <QtIfwInstallationDir>\bin\binarycreator.exe
```
There is no wizard generator for windows, so wizard.json should be provided
and copied inside repository main directory.

QtIFW is included in standard Qt installers from Qt Project
(qt.io/downloads). Alternatively, you can compile QtIFW from source - but
that is not necessary and will take you much more time.

Doxygen: on Windows, download and install the installer from
http://www.doxygen.nl/download.html. On Linux, doxygen is usually available
from your package manager, so do something like:

```
sudo apt install doxygen
```



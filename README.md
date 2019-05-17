Milo QtCreator wizard
===

Source code: [GitHub](https://github.com/milosolutions)

![Milo Wizard](doc/img/wizard_selection.png "Milo wizard in QtCreator")

# Intro

Milo Code Database is the place where we keep all useful pieces of code:
snippets, working modules, templates. The repository is organised into a Qt
Installer Framework project. MCDB is a great way to skip all the mundane and
boring code you have to write for each new project - here you get all the
initial project code prepared and ready for further development.

If you need some mobule for an existing project, see [subprojects](doc/subprojects.md). That page
also contains links to online documentation.

If you are creating a new project, you are encouraged to check our MCDB
installers. See the following sections for more details.

# Subprojects

Subproject documentation is listed [here](doc/subprojects.md).

# QtCreator Wizard

You can find prebuilt installers of Milo QtCreator Wizard on our
[Seafile](https://seafile.milosolutions.com/d/2c50614e1e/).

The wizard is the quickest way to create a new project: with all
necessary boilerplate code in place. The .pro file, doxygen, logger, build
helpers, CI scripts, config classes... everything you choose to include
(the process is customizable) will be extracted to a single place - all
that is left for you is start coding the
interesting bits!

# Using MCDB

Milo Code DB can be used in 2 main ways:

1. Use the Milo QtCreator Wizard to set up a new project. Add any modules you will need.
2. Use MCDB modules in an existing project: either by copying the code or adding
them as git submodules.

Each MCDB submodule contains a readme file and doxygen documentation, so refer
to them for more info. All docs are also available
[online](https://docs.milosolutions.com/milo-code-db/main/subprojects.html).

## Starting from wizard

If you want to install MILO QtCreator Wizard, go to
[Seafile](https://seafile.milosolutions.com/d/2c50614e1e/) and download the
newest installer for your platform.

![Milo Installer](doc/img/installer_intro.png "Milo installer")

Run it (you may need to set the executable permission on Linux) and install it in default location.
![Milo Installer](doc/img/installer_location.png "Milo installer location")
If you have previous installation it will be updated.

At this point now you should be able to setup new project inside QtCreator (restart necessary!).
![Milo Wizard](doc/img/wizard_selection.png "Milo wizard in QtCreator")

Creating new project involves several simple steps.

Choosing project location
![Milo Wizard](doc/img/wizard_project_location.png "Choosing project location")

Choosing build system (currenty only qmake is supported)
![Milo Wizard](doc/img/wizard_build_system.png "Choosing build system")

Choosing Kit
![Milo Wizard](doc/img/wizard_kit.png "Choosing kit")

On the following screen you get to choose the Milo Code Database modules you
want to use in your project. All modules will be automatically added to your
.pro file - after installation the project will be ready to be used, either
with raw qmake or with Qt Creator.
![Milo Wizard](doc/img/wizard_modules.png "Modules to choose")

If you select "Add to version control", the wizard will initialize repository for you.
All version control options are  optional.
![Milo Wizard](doc/img/wizard_summary.png "Wizard summary")

When the wizard work is done, QtCreator will open the .pro file 
You can start coding at this point!. See the README.md located in your newly installed project for further
instructions.

## Using in existing project

You can also easily add MCDB modules to an existing Qt project. All that is
required is to:

1. Get the module source code (either copy it, or include as git submodule).
2. Add the module's .pri file to your main .pro.
3. You're ready!

# Developing MCDB

## Building installer

Instructions for building Milo Wizard installer are listed
[here](doc/buildinginstaller.md).


## Requirements for new modules

Each separate piece of technology we share should be kept in a separate git
repository, and imported to DB using git submodule add. Milo Code Database
is only acting as a "home" to them all (mcdb-installer repository).

All code has to be properly licensed, documented, contain readme and doxygen
docs. More information about adding new modules is available in
[Repository guide](doc/repositoryguide.md).

# License

This project is licensed under the MIT License - see the LICENSE-MiloCodeDB.txt
file for details

# Further reading 

Checkout instructions are contained in [Repository guide](doc/repositoryguide.md).
This document also contains hints on how to efficiently (and correctly) use this
meta-repository and all submodules.

Repository guide
===

# Initial checkout

To fully checkout (do it only once, when checking out the first time!):
~~~
  git clone ssh://git@git.milosolutions.com:8922/milo-code-database/milo-qtcreator-wizard.git
  cd milo-qtcreator-wizard
  git submodule update --init --recursive
  git submodule foreach git pull origin master
~~~

# Update

To update repo (each time you want to work on newest sources):
~~~
  git pull
  git submodule update
~~~

# Pull newest changes from all submodules

This is a bit tricky: `git submodule update` only updates modules to newest
version saved in parent repository. In order to really check out newest code
from all submodules, you can do it:

## Manually

Call `git pull` in root dir, and then cd into all modules and manually call `git pull` there.

Then in root dir call:
~~~
git status
git commit -a
~~~

## Automatically

Use `update-submodules` command from sierdzio's Bash scripts: https://github.com/sierdzio/sierdzios-bash-scripts or use `git pull --recurse-submodules`

Then, in root dir, call:
~~~
git status
git commit -a
~~~

# What to do when I want to modify a submodule?

After updating code in a submodule, you need to commit the data to local (submodule)
repository - just as if it was a normal repo. Then you need to go up and update the
root repository. Below is a short info on how to do it:

~~~
  git add [...]
  git commit [...]
  git push [...]
  cd (main repo root)
  git add <module directory name>
  git commit -m 'updated submodule X'
  git push
~~~

# Adding new module

1. Add new submodule repositories into 
[milo-code-database](https://git.milosolutions.com/milo-code-database)
group on GitLab. If you lack permissions, ask your PPM about it.

2. Add submodule repository into Milo Code DB installer:
~~~
git submodule add ssh://path.to.repository packages/modulename
~~~
Check and modify .gitmodules

3. Copy the "doc" directory from any other module and adapt it to your needs.

4. Add backlink to project main page in README.md (see the first lines of any
other README in code DB repo).

5. Add link to new project documentation to main (installer) docs: docs/subprojects.md

6. ~~Add your submodule tag file path to TAGFILES to milocodedb.doxyfile~~ Copy .gitlab-ci.yml from other package and adapt it if necessary.

7. Please remember to use \ref miloHeader in all header and source files within Milo Code Database - our clients need to be informed that this code is shared between various projects (across NDA boundaries). It is located in doc/miloheader.md file.
You can also use `scripts/insert_milo_header.sh` script to add all headers automatically.

8. Add build instructions to scripts/build_unix.sh and scripts/build_windows.bat

9. Add new module to GitLab CI at ci.milosolutions.com - you can copy and adjust the build script from any other module. CI only builds the documentation - DB installer needs to be built in another way

10. To incorporate your module in Milo Wizard:
    1. Add your module to MODULES in generator.sh
    2. Modify template.pro & test/tests.pro in mtemplatewizard module

11. You can either ask [PPM](https://wiki.milosolutions.com/index.php/PPM) to build the installer and upload it to Seafile, or you can do it yourself - use scripts/deploy.sh on Unix. On Windows the process is more manual - the installer has to be copied to Seafile by hand. In the future it is planned to build everything using CI.



# Further reading

More info: [Submodule tutorial from kernel.org](https://git.wiki.kernel.org/index.php/GitSubmoduleTutorial)

And: [Submodule tutorial from official Git book](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

#!/bin/bash

if [ "${1}" = "-h" ] || [ "${1}" = "--help" ]; then
  echo "Usage: ./scripts/git_setup [branch] [milo git address]"
  echo ""
  echo "Sets up Milo Code DB rerpository with all submodules, checks out master"
  echo "branches in all subdirs, and adds GitLab and GitHub remotes."
  echo "If first argument is not empty, it will be used as the name of branch "
  echo "to check out."
  echo
  echo "The second argument is address and port of GitLab instance at Milo."
  exit
fi

BRANCH=master
if [[ ! -z "$1" ]] ; then
  BRANCH="$1"
fi

MILO_GIT=""
if [[ ! -z "$2" ]] ; then
  MILO_GIT="$2"
fi

if [ -d .git ] && [ -d packages ] ; then
  echo "Initializing submodules"
  git submodule update --init --recursive
  echo "Fetching newest data"
  git submodule foreach git fetch
  echo "Checking out $BRANCH branches"
  git submodule foreach git checkout "$BRANCH"
  if [[ ! -z "$MILO_GIT" ]] ; then
  echo "Adding GitLab remote"
    git remote add gitlab ssh://git@$MILO_GIT/milo-code-database/milo-qtcreator-wizard.git
    git submodule foreach git remote add gitlab ssh://$MILO_GIT/milo-code-database/$name.git
  fi
  echo "Adding GitHub remote"
  git remote add github git@github.com:milosolutions/milo-qtcreator-wizard.git
  git submodule foreach git remote add github git@github.com:milosolutions/$name.git
  echo "Done. Remotes are:"
  git remote
  exit
fi

echo "Wrong working directory! Make sure you are in root dir of "
echo "milo-qtcreator-wizard repository!"

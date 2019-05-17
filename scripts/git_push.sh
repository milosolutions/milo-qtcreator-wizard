#!/bin/bash

if [ "${1}" = "-h" ] || [ "${1}" = "--help" ]; then
  echo "Usage: ./scripts/git_push branch [for each?]"
  echo ""
  echo "Pushes selected branch to both GitLab and GitHub remotes. If 'for each'"
  echo "is set, this push will be performed for all submodules."
  exit
fi

BRANCH="$1"
if [ -z "$BRANCH" ] ; then
  echo "Branch cannot be empty!"
  exit 1
fi

IS_FOR_EACH=$2

if [ -z "$IS_FOR_EACH" ] ; then
  echo "Pushing current dir to $BRANCH branch"
  git push 'gitlab $BRANCH'
  git push 'github $BRANCH'
  git fetch
else
  echo "Pushing all submodules to $BRANCH branch"
  git push 'gitlab $BRANCH'
  git push 'github $BRANCH'
  git submodule foreach 'git push gitlab $BRANCH'
  git submodule foreach 'git push github $BRANCH'
  git submodule foreach 'git fetch'
fi

echo "Done"

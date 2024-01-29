#!/usr/bin/env bash
# run as
# git submodule foreach bash $(pwd)/submodules_check_branch.sh
# get the name of main branch
main_branch=$(git branch -rl '*/HEAD' | awk -F'-> ' '{print $NF}')
branch_hash=$(git rev-parse "$main_branch")
HEAD_hash=$(git rev-parse HEAD)

if [ "$branch_hash" = "$HEAD_hash" ]
then
  echo "Nothing to do."
else
  echo "Updates available"
fi

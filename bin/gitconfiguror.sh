#!/bin/bash

link=$1
dir=$2
repo=$3
parentscriptdir=`pwd`
usage= "Usage: ./gitconfiguror REPOSITORY_LINK RELATIVE_PATH_TO_DESIRED_PARENT_DIR REPO_NAME \
        NOTE: please do not use this script on existing repositories with established .gitignores"

if [ $# != 3 ]; then
  echo $usage
  exit
fi

echo "changing into $dir now..."
cd $dir
echo "changed! now in $dir\..."

echo "attempting to clone $link from git..."
git clone $link
echo "cloned into $link\!"

cd $repo

echo "now time to copy over gitignore..."
cp ~/Documents/CS/dotconfigfiles/gitignore .gitignore
echo "copied!"

echo "exiting now..."
exit





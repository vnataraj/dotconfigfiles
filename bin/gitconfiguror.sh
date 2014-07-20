#!/bin/bash

link=$1
dir=$2
parentscriptdir=`pwd`
usage= "Usage: ./gitconfiguror REPOSITORY_LINK RELATIVE_PATH_TO_DESIRED_PARENT_DIR\
        NOTE: please do not use this script on existing repositories with established .gitignores"

if [ $# != 2 ]; then
  echo $usage
fi

echo "changing into $dir now..."
cd $dir
echo "changed! now in $dir\..."

echo "attempting to clone $link from git..."
git clone $link
echo "cloned into $link\!"

echo "now time to copy over gitignore..."
cp $parentscriptdir/gitignore .gitignore
echo "copied!"

echo "exiting now..."
exit





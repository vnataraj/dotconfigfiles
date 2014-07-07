#!/bin/bash

usage="Please specify the directory that you use for your projects as the first command line argument like so\
       e.g: ./project_updater Documents/CS/  \
       comments, questions, or concerns? email me at vnataraj@purdue.edu \ "

if [ $# -lt 1 ]; then
  echo $usage
  exit
elif [ $# -gt 1 ]; then
  echo $usage
  exit
else
  dir=$1
fi

echo "changing into $dir now..."
cd $dir
echo "changed dir into $dir!"

echo "finding list of directories..."
file=`pwd`
files=$file"/*"
echo "found list"

for f in $files; do
cd $f
if [ $? -eq 0 ]; then
  echo "changed into $f, now checking for updates..."
  git pull
  echo "returning to previous directory..."
  cd ..
  echo "proceeding..."
else
  echo "$f is a file, moving on..."
fi
done

echo "all repositories in directory have been upgraded!"
exit



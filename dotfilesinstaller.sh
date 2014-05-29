#!/bin/sh

dir=~/Documents/dotconfigfiles

files="bashrcsuse vimrc"

echo "Changing to directory where dotfiles are stored"
cd $dir
echo "changed directory..."


for file in $files; do
  if [ $file == "bashrcsuse" ] && [ $OSTYPE == "linux" ]; then
    echo "detected OStype as $OSTYPE, moving $file into bashrc"
    file="bashrc"
  elif [ $file == "bashrcmac" ] && [ "$OSTYPE" == "darwin"* ]; then
    echo "detected OStype as $OSTYPE, moving $file into bashrc"
    file="bashrc"
  fi
	echo "symlinking from directory"
	ln -s $dir/$file ~/.$file
	echo "symlinked $file successfully"
done

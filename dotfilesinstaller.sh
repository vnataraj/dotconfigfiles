#!/bin/sh
os=${OSTYPE//[0-9.]/}
if [ $os == "darwin" ]; then
	dir=~/Documents/CS/dotconfigfiles
else
	dir=~/Documents/dotconfigfiles
fi

if [ $os == "darwin" ]; then
	files="bashrcmac vimrc profile"
elif [ $os == "linux" ]; then
	files="bashrcsuse vimrc"
else
	files="bashrcmac vimrc"
fi

echo "Changing to directory where dotfiles are stored"
cd $dir
echo "changed directory..."


for file in $files; do
  if [ $file == "bashrcsuse" ] && [ $os == "linux" ]; then
    echo "detected OStype as $os, moving $file into bashrc"
    file="bashrc"
  elif [ $file == "bashrcmac" ] && [ $os == "darwin" ]; then
    echo "detected OStype as $os, moving $file into bashrc"
    file="bashrc"
  fi
	echo "symlinking from directory"
	ln -s $dir/$file ~/.$file
	echo "symlinked $file successfully"
done

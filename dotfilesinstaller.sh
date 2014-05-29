#!/bin/sh
if [ $OSTYPE == "darwin"* ]; then
	dir=~/Documents/CS/dotconfigfiles
else
	dir=~/Documents/dotconfigfiles
fi
if [ $OSTYPE == "darwin"* ]; then
	files="bashrcmac vimrc profile"
elif [ $OSTYPE == "linux" ]; then
	files="bashrcsuse vimrc"
else
	files="bashrcmac vimrc"
fi

echo "Changing to directory where dotfiles are stored"
cd $dir
echo "changed directory..."


for file in $files; do
  if [ $file == "bashrcsuse" ] && [ $OSTYPE == "linux" ]; then
    echo "detected OStype as $OSTYPE, moving $file into bashrc"
    file="bashrc"
  elif [ $file == "bashrcmac" ] && [ $OSTYPE == "darwin"* ]; then
    echo "detected OStype as $OSTYPE, moving $file into bashrc"
    file="bashrc"
  fi
	echo "symlinking from directory"
	ln -s $dir/$file ~/.$file
	echo "symlinked $file successfully"
done

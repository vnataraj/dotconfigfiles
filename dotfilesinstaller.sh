#!/bin/sh
os=${OSTYPE//[0-9.]/}
if [ $os == "darwin" ]; then
	dir=~/Documents/CS/dotconfigfiles
else
	dir=~/Documents/dotconfigfiles
fi

if [ $os == "darwin" ]; then
	files="bashrcmac vimrc profile tmux.conf"
elif [ $os == "linux" ]; then
	files="bashrcsuse vimrc tmux.conf"
else
	files="bashrcmac vimrc tmux.conf"
fi

echo "Changing to directory where dotfiles are stored"
cd $dir
echo "changed directory..."


for file in $files; do
  if [ $file == "bashrcsuse" ] && [ $os == "linux" ]; then
    echo "detected OStype as $os, moving $file into bashrc"
    filetomove="bashrc"
  elif [ $file == "bashrcmac" ] && [ $os == "darwin" ]; then
    echo "detected OStype as $os, moving $file into bashrc"
    filetomove="bashrc"
  else
    filetomove=$file
  fi

  if [ -e ~/.$filetomove ]; then
    echo "~/.$filetomove already exists!"
    while true; do
    read -p "Do you wish to overwrite this file?" yn
    case $yn in
        [Yy]* ) rm -rf ~/.$filetomove ; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
  done
  fi
	echo "symlinking from directory"
	ln -s $dir/$file ~/.$filetomove
	echo "symlinked $file successfully"
done

#!/bin/bash
os=${OSTYPE//[0-9.]/}
if [ $os == "darwin" ]; then
	dir=~/Documents/CS/dotconfigfiles
else
	dir=~/Documents/dotconfigfiles
fi

if [ $os == "darwin" ]; then
	files="bashrcmac vimrc profile tmux.conf bash_profile dircolors"
elif [ $os == "linux" ]; then
	files="bashrcsuse vimrc tmux.conf bash_profile"
elif [ $os == "linux-gnu" ]; then
  files="bashrcsuse vimrc tmux.conf bash_profile"
else
	files="bashrcmac vimrc tmux.conf bash_profile"
fi

echo "Changing to directory where dotfiles are stored"
cd $dir
echo "changed directory..."


for file in $files; do
  if [ $file == "bashrcsuse" ] && [ $os == "linux" ]; then
    echo "detected OStype as $os, moving $file into bashrc"
    filetomove="bashrc"
  elif [ $file == "bashrcsuse" ] && [ $os == "linux-gnu" ]; then
    echo "detected OStype as $os, moving $file into bashrc"
    filetomove="bashrc"
  elif [ $file == "bashrcmac" ] && [ $os == "darwin" ]; then
    echo "detected OStype as $os, moving $file into bashrc"
    filetomove="bashrc"
  else
    filetomove=$file
  fi

  if [ -e ~/"."$filetomove ]; then
    echo "~/.$filetomove already exists!"
    while true; do
    read -p "Do you wish to overwrite this file?" yn
    case $yn in
        [Yy]* ) rm -rf ~/.$filetomove ; ln -s $dir/$file ~/.$filetomove ; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
    done
  else
    echo "symlinking from directory"
    ln -s $dir/$file ~/.$filetomove
    echo "symlinked $file successfully!"
  fi
done

echo "finished symlinking all config files, exiting now!"
exit

###
# This script is for adding other scripts(the ones in these directories) into a folder that is easy for the user to access. 
# For simplicity, we will skip adding the scripts to the /usr/local/bin directory and will instead add them to the user's own home folder in the bin/ subdirectory

bin=~/bin
root=`pwd`
files=*.sh
usage="THIS SCRIPT IS USED TO INSTALL OTHER SCRIPTS ONLY.  PLEASE RUN THIS ONLY FROM THE DOTCONFIG BIN ROOT DIRECTORY.\
VIPUL NATARAJ(@vnataraj, vnataraj@purdue.edu) IS \\NOT\\ RESPONSIBLE FOR ANY GRIEVANCES OR DATA LOSS INCURRED FROM USING THIS SCRIPT OUTSIDE OF ITS INTENDED DIRECTORY"

#########
#first print usage
echo $usage
#now get input
while true; do
    read -p "Do you still wish to continue?" yn
    case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

#########
cd $bin

if [ $? -eq 0 ]; then
  echo "no need to create $bin, moving symlinks of scripts into dir"
  cd $root
else
  cd
  mkdir $bin
  cd $root
fi

for f in $files; do
  if [ -e $bin/$f@ ]; then
    echo "$f already exists!"
    while true; do
    read -p "Do you wish to overwrite this file?" yn
    case $yn in
    [Yy]* ) rm -rf $bin/$f ; break;;
    [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
    done
  fi
  echo "symlinking from directory"
  ln -s $root/$f $bin/${f%.sh}
  if [ $? -eq 0 ]; then 
    echo "symlinked $f successfully!"
  else
    echo "could not symlink $f!"
  fi
  done

echo "finished symlinking all scripts! exiting...."
exit

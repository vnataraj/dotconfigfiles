###
# This script is for adding other scripts(the ones in these directories) into a folder that is easy for the user to access. 
# For simplicity, we will skip adding the scripts to the /usr/local/bin directory and will instead add them to the user's own home folder in the bin/ subdirectory

bin=~/bin
root=`pwd`
files=$root/*.pdf #/TODO: Find a good way to express this variable 

cd $bin

if [ $? -eq 0 ]; then
  echo "no need to create $bin, moving symlinks of scripts into dir"
else
  mkdir $bin
fi

echo "changing into $bin now..."
cd $bin
echo "changed into $bin\!"

for f in $files; do
  if [ -e $bin/$f ]; then
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
  ln -s $f $bin/$f
  echo "symlinked $f successfully"
done

echo "finished symlinking all scripts! exiting...."
exit

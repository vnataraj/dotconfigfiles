file=$1
actualdir=`pwd`
usage="Fetch random dot files into your current directory! \
  usage: fetch [filename] \
  note: this was written for gitignores"

if [ $# != 1 ]; then
  echo $usage
  exit
fi

echo "attempting to find file in dotfiles"
if [ -e ~/Documents/CS/dotconfigfiles/$file ]; then
  echo "found file in dotfiles!"
  echo "attempting to copy now"
  cp ~/Documents/CS/dotconfigfiles/$file $actualdir/.$file
  if [ $? -eq 0 ]; then
    echo "copied!!"
  else
    echo "sorry, the operation could not be completed at this time."
    exit
  fi
fi

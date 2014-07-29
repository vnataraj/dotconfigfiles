#plugin installer/updater for all current plugins
home=~/Documents/dotconfigfiles

#install vundle if it doesn't exist already

if [ -e ~/.vim/bundle/Vundle.vim ]; then
  read -sn 1 -p "Vundle exists! for plugins, open Vim and type :PluginInstall!"
else
  cd ~/vim/bundle/
  git clone https://github.com/gmarik/Vundle.vim.git
  if [ $# -eq 0 ]; then
    echo "cloned!!"
  else
    echo "command could not be completed!"
  fi
fi

exit


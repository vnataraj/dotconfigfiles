#plugin installer/updater for all current plugins
home=~/Documents/dotconfigfiles
plugins="https://github.com/ervandew/supertab.git https://github.com/scrooloose/syntastic.git https://github.com/bling/vim-airline.git https://github.com/tpope/vim-fugitive.git"

#install pathogen if it doesn't exist already

if [ -e ~/.vim/autoload/pathogen.vim ]; then
  read -sn 1 -p "Pathogen exists! for plugins, press any key to continue..."
else
  mkdir -p ~/.vim/autoload ~/.vim/bundle; \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi
#now that pathogen is installed, install the plugins

echo "changing directory to ~/.vim/bundle directory"
cd ~/.vim/bundle
echo "changed directory to ~/.vim/bundle !"
for plugin in $plugins; do
  echo "cloning into $plugin"
  git clone $plugin
  echo "cloned $plugin"
done




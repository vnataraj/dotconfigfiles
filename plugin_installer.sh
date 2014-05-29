#plugin installer/updater for all current plugins
home=~/Documents/dotconfigfiles
plugins="https://github.com/ervandew/supertab.git "

#install pathogen if it doesn't exist already

if [ -e ~/.vim/autoload/pathogen.vim ]; then
  echo "Pathogen exists! for plugins, press ENTER to continue; or press any other key to quit"
else
  mkdir -p ~/.vim/autoload ~/.vim/bundle; \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi
#now that pathogen is installed, install the plugins

cd ~/.vim/bundle
for plugin in $plugins; do
  echo "cloning into $plugin"
  git clone $plugin
  echo "cloned $plugin"
done





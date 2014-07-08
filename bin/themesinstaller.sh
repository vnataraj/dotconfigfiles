#get themes, clone into them, and subsequently delete them after moving the relevant parts
repos="https://github.com/nanotech/jellybeans.vim.git"
names="jellybeans.vim"
dir=~/Downloads/vimthemes
color=~/.vim/colors

if [ ! -e $color ]; then
  mkdir -p $color
fi
mkdir -p $dir
cd $dir

#clone repos of all the colorschemes
for repo in $repos; do
  echo "now cloning into $repo"
  git clone $repo
  echo "cloned $repo !"
done

#move vim config files of all the colorschemes into parent vim directory
cd $color
for file in $names; do
  mv $dir/$file/colors/*.vim .
done
cd $dir

#clean up a bit...
cd ~/Downloads
rm -rf vimthemes/
echo "vimthemes directory removed!"


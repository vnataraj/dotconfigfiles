#get themes, clone into them, and subsequently delete them after moving the relevant parts
repos="https://github.com/nanotech/jellybeans.vim.git"
dir=~/Downloads/vimthemes
color=~/.vim/colors
mkdir -p $dir
cd $dir

#clone repos of all the colorschemes
for repo in $repos; do
  echo "now cloning into $repo"
  git clone $repo
  echo "cloned $repo\!"
done

#move vim config files of all the colorschemes into parent vim directory
for file in $dir; do
  cd $file/colors
  mv *.vim $color/.
  cd $dir
done

#clean up a bit...
cd ~/Downloads
rm -rf vimthemes/
echo "vimthemes directory removed!"


# updates vim git plugins to their latest versions

echo "changing into ~/.vim/bundle..."
cd ~/.vim/bundle
echo "changed into ~/.vim/bundle!"

for i in `ls`; do
  echo "updating $i now..."
  cd $i
  git pull
  cd ..
  echo "updated $i!"
done

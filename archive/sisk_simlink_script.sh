#!/bin/sh

for file in `find ${0%/*} -name ".*"`; do
  filename=$(basename $file)
  if [ ! -f $HOME/$filename ]; then
    echo "Linking $filename"
    ln -s $file $HOME/$filename
  else
    echo "$file already exists"
  fi
done

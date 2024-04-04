#!/bin/bash

# We first need to find all the file names that contain the keyword we are looking for. We can use grep command here



#setting up arguements to be passed via bash when running

original_kwrd="$1" #--> keyword that you want to replace
new_kwrd="$2" # --> Keyword that you want to replace to

# outoputs file names only if they meet the grep condition
files=$(grep -rl --exclude="*.ipynb_checkpoint" --exclude-dir=".ipynb_checkpoints" "$original_kwrd")


#iterates over the files in grep output and dynamically changes keywords in file.
#sed -i ==inplace
#s prefix --> substitute
#g suffix --> global

for file in $files; do
  sed -i "s/$original_kwrd/$new_kwrd/g" "$file"
  echo "Replaced $original_kwrd with $new_kwrd in file:$file "

done
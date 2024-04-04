#!/bin/bash

# We first need to find all the file names that contain the keyword we are looking for. We can use grep command here

# checking to see if runtime arguements are valid
if [ $# -ne 2 ]; then
    echo "Usage: $0 <original_keyword> <new_keyword>"
    exit 1
fi

#setting up arguements to be passed via bash when running

original_kwrd="$1" #--> keyword that you want to replace
new_kwrd="$2" # --> Keyword that you want to replace to

# outoputs file names only if they meet the grep condition
files=$(grep -rl --exclude="*.ipynb_checkpoint" --exclude-dir=".ipynb_checkpoints" "$original_kwrd")


#check to see if we generate any files from grep command


#iterates over the files in grep output and dynamically changes keywords in file.
#sed -i ==inplace
#s prefix --> substitute
#g suffix --> global

for file in $files; do
        if [ -z $file ]; then
            printf "No Files Found containing '%s'\n" "$original_kwrd"
            exit 0

        else printf "File name being changed: %s\n" "$file"
        sed -i "s/$original_kwrd/$new_kwrd/g" "$file" && echo "Replaced $original_kwrd with $new_kwrd in file:$file "
        fi
  

done


#Example

# chmod +x run_bash.sh

# run_bash.sh "old_kword_to_replace" "new_keyword_
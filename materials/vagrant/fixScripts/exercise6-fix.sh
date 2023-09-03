#!/bin/bash

# Check if at least 2 arguments are passed, SOURCE and DEST
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 [source]...[destination]. input at least 2 arguments"
  exit 1
fi

dest="${@: -1}"

if [ "$(hostname)" == 'server1' ]; then
  dest_host='server2'
else
  dest_host='server1'
fi

txt=0

# Loop through all the arguments except the last one
for ((i=1; i<$#; i++)); do
  file="${!i}"

  # Check if the file exists
  if [ ! -f "$file" ]; then
    echo "WARNING: $local file/directory does not exist, action skipped."
    continue
  fi

  # Copy the file to the destination
  temp=$(rsync -avr --stats $file $dest_host:$dest | grep 'Total transferred file size:' | cut -d" " -f 5)
  #echo $temp
  temp="${temp//,/}"
  ((txt+=temp))
  #echo "Copied '$file' to '$dest_host:$dest'"
done

echo "$txt"

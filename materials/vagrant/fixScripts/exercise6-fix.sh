#!/bin/bash

# Check if at least 2 arguments are passed, SOURCE and DEST
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 [source]...[destination]. input at least 2 arguments"
  exit 1
fi

dest="${@: -1}"

HOSTNAME="$(hostname)"

if [ "${HOSTNAME}" == 'server1' ]; then
  dest_host='192.168.60.11'
elif [ "${HOSTNAME}" == 'server2' ]; then 
  dest_host='192.168.60.10'
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
  temp=$(su vagrant -c "rsync -avr --stats -e 'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR' $file vagrant@$dest_host:$dest" 2>/dev/null <<< 'vagrant' | grep 'Total transferred file size')
  #temp=$(grep 'Total transferred file size:' $temp)
  temp=$(cut -d' ' -f 5 -<<<$temp)
  temp="${temp//,/}"
  ((txt+=temp))
done

echo $txt

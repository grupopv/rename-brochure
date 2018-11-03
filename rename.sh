#!/bin/bash

# Variables
filename=$1
path=$2
counter=0
suffix="000"
extension="pdf"

while IFS=, read domain
do
  ((counter=$counter+1))

  if [ $counter -lt 10 ]; then
    prefix=00
  elif [ $counter -lt 100 ]; then
    prefix=0
  else
    prefix=
  fi

  domain=$(echo $domain | tr -d '\r')
  original_name=$filename$prefix$counter$suffix.$extension
  new_name=pdfs/$domain/$path/$filename.$extension

  echo "Renaming $original_name to $new_name"
  mkdir -p pdfs/$domain/$path
  mv $original_name $new_name
done < domains.csv

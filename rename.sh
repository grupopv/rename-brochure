#!/bin/bash

# Variables
file=0

while IFS=, read domain
do
  ((file=$file+1))
  new_name=$(echo $domain | tr -d '\r')

  if [ $file -lt 10 ]
  then
    prefix=00
  elif [ $file -lt 100 ]
  then
    prefix=0
  else
    prefix=
  fi

  echo "Renaming $1-$prefix$file"000".pdf to pdfs/$new_name$2$1.pdf"
  mkdir -p pdfs/$new_name$2
  mv $1-$prefix$file"000".pdf pdfs/$new_name$2$1.pdf
done < domains.csv

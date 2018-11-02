#!/bin/bash

# Variables
file=0

while IFS=, read domain
do
  ((file=$file+1))
  new_name=$(echo $domain | tr -d '\r')

  echo "Renaming $1-$file.pdf to pdfs/$new_name$2$1.pdf"
  mkdir -p pdfs/$new_name$2
  mv $1-$file.pdf pdfs/$new_name$2$1.pdf
done < domains.csv

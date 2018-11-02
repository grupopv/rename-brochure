#!/bin/bash
# Example: ./rename.sh vz30 /radios/vertex-standard/

# Variables
file=0

while IFS=, read domain
do
  ((file=$file+1))
  new_name=$(echo $domain | tr -d '\r')

  echo "Renombrando $1-$file.pdf a pdfs/$new_name$2$1.pdf"
  mkdir -p pdfs/$new_name$2
  mv $1-$file.pdf pdfs/$new_name$2$1.pdf
done < domains.csv

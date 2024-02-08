#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <country>"
    exit 1
fi

country="$1"

if [ ! -e "Year_Mag_Country.tsv" ]; then
    echo "Error: Year_Mag_Country.tsv does not exist"
    exit 1
fi

total_eq=$(awk -F'\t' -v country="$country" '$3 == country {sum += 1} END {print sum}' Year_Mag_Country.tsv)

echo "Total number of earthquakes in $country: $total_eq"


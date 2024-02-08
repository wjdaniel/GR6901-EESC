#!/bin/bash


if [ ! -e "Year_Mag_Country.tsv" ]; then
    echo "Error: Year_Mag_Country.tsv does not exist"
    exit 1
fi
data_file="Year_Mag_Country.tsv"

if [ ! -e "loopfile.tsv" ]; then
    echo "Error: loopfile.tsv does not exist"
    exit 1
fi
loop_file="loopfile.tsv"

years=$(sort -nr "$loop_file")

for YEAR in $years; do
    # Find earthquakes for the current year and write to file
    grep "^$YEAR[[:space:]]" "$data_file" > "$YEAR-earthquakes.txt"
    echo "Earthquakes for $YEAR written to $YEAR-earthquakes.txt"
done

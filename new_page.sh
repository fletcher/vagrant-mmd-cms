#!/bin/sh

USAGE="Usage: `basename $0` \"Title of article\""

# Ensure we have a title
if [ $# -eq 0 ]; then
	echo $USAGE >&2
	exit 1
fi

TITLE=$1
LOWER=`echo "$TITLE" | awk '{print tolower($0)}'`
FILE=`echo "$LOWER" | tr ' ' '_'`
YEAR=`date +%Y`
MONTH=`date +%m`

# Ensure directory available
mkdir -p www/$YEAR/$MONTH

# Create template file
echo "Title:	$TITLE  " > www/$YEAR/$MONTH/$FILE.txt
echo "Date:	`date '+%m/%d/%Y %H:%M:%S'`  " >> www/$YEAR/$MONTH/$FILE.txt
echo "Tags:	  " >> www/$YEAR/$MONTH/$FILE.txt
echo "" >> www/$YEAR/$MONTH/$FILE.txt

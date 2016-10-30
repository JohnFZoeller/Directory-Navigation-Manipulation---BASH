#!/bin/bash

#John Zoeller
#Homework1
#Displays information about .ogg music files.
#
#There Must be a music folder in the 
#same directory as this file, its structure should
#be Music/Genres/Artists/Albums/tracks
#

/bin/echo -n "Total Tracks: ";
ls -R Music | 
grep ".ogg" | 
wc -l; 
echo " ";

/bin/echo -n "Total Artists: "; 
ls -d Music/*/*/ |
cut -d "/" -f3 |
sort | uniq | 
wc -l; 
echo " "; 

echo "Multi-Genre Artists:"; 
ls -d Music/*/*/ | 
cut -d "/" -f3 | 
sort | uniq -d; 
echo " "; 

echo "Multi-Disk Albums:"; 
find Music -maxdepth 4 | 
cut -d "/" -f4,5 | 
grep -v ".ogg" | 
grep "/" | 
sort | 
cut -d "/" -f1 | 
uniq;
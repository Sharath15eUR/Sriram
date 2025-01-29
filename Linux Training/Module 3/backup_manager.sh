#!/bin/bash
echo " "
echo "Q1) to demonstrate that the script accepting 3 arguments"
echo ""

echo "this is the source directory -> $1"
echo "this is the backup directory -> $2"
echo "this is the file extension of files to be backed up ->$3" 
echo ""
#--------------------------------------------------------------------------------------

echo "Q2) to find the matched extension files with globbing"
echo " " 
files=("$1"/*"$3")
echo "files found :"

for i in ${files[@]}
do
 echo "$(basename $i)"
done
echo ""

#--------------------------------------------------------------------------------------

echo "Q3) environment variables to track the number of files and total backup size"
echo " "
export BACKUP_COUNT=0
export size_files=0
echo "env var -BACKUP_COUNT to keep track of no.of backed up files before backup = $BACKUP_COUNT"
echo "env var -size_files to keep track of size of backed up files before backup = $size_files"
echo " "

#--------------------------------------------------------------------------------------
echo "Q4) Print the names of these files along with their sizes before performing the backup"
echo " "

for i in ${files[@]}
do
  echo -n "$i " 
  echo "$(stat -c %s "$i") bytes "
done
echo "" 

#--------------------------------------------------------------------------------------

echo "Q5) i) if the backup directory does not exist, create it. If creation fails, exit with an error"
echo ""

if [ -d $2 ]; then
   echo "backup directory exists"
else
   echo "directory doesnt exist"
   mkdir -p $2
   if [ $? -eq 0 ];then
      echo "backup directory created successfully"
   else 
      echo "backup directory creation failed"
      exit 1
   fi
fi
echo ""

#------------------------------------------------------------------------------------------

echo "Q5) ii) if the source directory is empty or contains no files matching the extension, exit with a message."
echo ""

source_check=($1/*)


if [ ${#source_check[@]} -eq 0 ];then
    echo "the source directory is empty"
    exit 1
elif [ ${#files[@]} -eq 0 ];then
    echo "no files found with matching file extension"
    exit 1
else 
   echo "the source directory is non-empty and has ${#source_check[@]} total files and ${#files[@]} matching files"
fi
echo ""

#------------------------------------------------------------------------------------------
echo "Q5) iii)  If a file already exists in the backup directory with the same name, only overwrite it if it is older than the source file (compare timestamps). "
echo ""

echo "starting backup ...."
echo ""

for i in ${files[@]}

do
  
  if [ -f "$2/$(basename "$i")" ]; then
   
     if [ "$(stat -c %Y $i)" -eq "$(stat -c %Y $2/$(basename $i))" ];then
	   
	      echo "both time-stamps of $(basename $i) are equal ... skipping backup"
	      ((BACKUP_COUNT += 0 ))
     else 
     
       echo "backing up $i to $2/$(basename $i) ...." 
             cp -p "$i" "$2/$(basename $i)"
	     ((BACKUP_COUNT+=1))
	     ((size_files+=$(stat -c %s $i))) 
      fi
 	      
  else
     echo "backing up $i to $2/$(basename $i) ...." 
     cp -p "$i" "$2/$(basename $i)"
     ((BACKUP_COUNT+=1))
     ((size_files+=$(stat -c %s $i)))
     
  fi  
  
done

#---------------------------------------------------------------------------------------------------
echo "" 
echo "Q)6) OUTPUT REPORT"
echo ""

echo "REPORT: 
      date :$(date) 
      Total no.of files processed : $BACKUP_COUNT 
      Total size of files backed up : $size_files bytes
      Path to the backup directory: $2" > $2/backup_report.log
      
cat $2/backup_report.log


#---------------------------------------------------------------------------------------------------



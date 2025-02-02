#!/bin/bash

directory=""
filename=""
keyword=""

#-----------------------------------------------------------------------------------
# Q)3) i) usage of Here document - help function for --help argument

display_help() {
    cat << EOF
Usage: $0 [options]

Options:
  -d <directory/>     Specify the directory to analyze ending with /.
  -f <filename>      Specify the filename to analyze.
  -k <keyword>       Specify the keyword to search for in the file.
  --help             Display this help message.

Example:
  $0 -d ~/Documents -f sample.txt -k keyword
  $0 --help
  
  
EOF
} 


#-----------------------------------------------------------------------------------
#Q6) command line argument with getopts

while getopts ":d:f:k:-:" opt; do

	     case $opt in
	     
		  d) directory=$OPTARG;;
		  f) filename=$OPTARG;;
		  k) keyword=$OPTARG;;
		  -) if [[ $OPTARG == "help" ]];then
		         display_help
		    else 
		         echo "invalid argument $OPTARG " | tee -a errors.log
		         exit 1
		    fi
		    ;;
		  :) echo "insufficient argument for $OPTARG " | tee -a errors.log
		     exit 1;;
		  
		  ?) echo "invalid argument $OPTARG " | tee -a errors.log
		     exit 1;;
	 
	     esac

done


#----------------------------------------------------------------------------------
#Q)5) validate inputs by checking directory,files and keywords are valid 

echo ""
validate_keyword(){

  if [[ -n "$1" && "$1" =~ ^[a-zA-z0-9.]+$ ]];then
  echo "kEYWORD: \"$keyword\" is non empty and a valid keyword"
  else
  echo "invalid keyword $keyword" | tee -a errors.log
  exit 1
  fi
}

validate_directory()
{
  if [[ -d "$directory" ]]; then
  echo "DIRECTORY: $directory exist"
  else
  echo "directory $directory doesn't exist" | tee -a errors.log
  exit 1
  fi
}


validate_file()
{
 
 if [[ -f "$path" ]]; then
 echo "FILE: $filename exist in $path"
 return 1
 else
 echo "file $filename doesn't exist in path $path" | tee -a errors.log
 exit 1
 fi

}

echo "INPUTS:"
path="$directory$filename"
validate_keyword "$keyword"
validate_directory "$directory"
validate_file "$path"
echo ""

#------------------------------------------------------------------------------------
# Q)4)special parameter usage to provide feedback

cat<< EOF
 
FEEDBACK:
shell script name: "$0"
total number of arguments passed: -$#
arguments passed : "$@" 
$(echo "")
EOF

#------------------------------------------------------------------------------------
# Q)3) ii) search for a keyword in the specified file with here string



search (){

echo "searching for keyword: \"$keyword\" in file: ($1) with here string...." 
grep "$keyword" <<< cat "$1"
if [[ $? == 1 ]]; then
echo "no lines found with keywrod: $keyword in $1" | tee -a errors.log
fi

}

echo "KEYWORD SEARCH IN GIVEN FILE"
search "$path"
echo ""
#-------------------------------------------------------------------------------------
#Q)1) to write a recursive function to search for files in a directory and its subdirectories containing specific keyword

echo "RECURSIVE KEYWORD SEARCH IN GIVEN DIRECTORY:"
recursive_search()
{ 
 
  local directory_path=$1
  local directories=($(ls "$directory_path"))
  
  for dir in "${directories[@]}"; do
    if [[ -d "$directory_path/$dir" ]];then
      echo "(${dir^^}) directory found in ($directory_path)"
      echo ""
      recursive_search "$directory_path/$dir"
    else 
      search "$directory_path/$dir"
      echo ""
    fi 
  done


}
recursive_search $directory 
#------------------------------------------------------------------------------------------------


#!/bin/bash
#
# teps - Replaces spaces in file and directory names.
#
# Author:
#	Leonardo Santos
#	<27875029+s4nt0sl30n4rd0@users.noreply.github.com>
#
# Maintenance:
#	Leonardo Santos
#	<27875029+s4nt0sl30n4rd0@users.noreply.github.com>
#
# -------------------------------------------------------------------------
#
# This program exchanges spaces for underscores (or dashs) in file and
# directory names recursively within the given directory, including itself.
# If a name or path to a directory is not entered as a parameter,
# it will act in the current directory.
#
# -------------------------------------------------------------------------
#
# License:
#
#	General Public License 3.0
#
# -------------------------------------------------------------------------

usage(){
	cat << EOF
Uso: $(basename $0) [-s|-t [DIR]] [-h]
     Replaces spaces in file and directory names.

     Exchanges spaces for underscores (or dashs) in file and directory names
     recursively within the given directory, including itself.

     Options:
       -s       explicitly define the underscore to replace spaces in names
       -t       define the dash to replace spaces in names
       -h       display this help and exit
 
     The default is to replace the blanks in the names with underscores,
     as if -s had been specified. If a name or path to a directory is not
     entered as a parameter, it will act in the current directory.

     Exit Status:
     Returns 0 for success and 1 for failure.
EOF
}

toRename(){
	cd "$local" 2> /dev/null
	
	if [ $? -eq 0 ]
	then
		space=1
		while [ $space -ne 0 ]
		do
			find -print0 | xargs -0 rename.ul ' ' '_' * 2> /dev/null
			space=$(find | grep -c ' ')
		done
		exit 0
	else
		echo 'Error: file or directory not found.'
		exit 1
	fi
}

#TODO Criar variável que guardará o sublinhado ou traço

#TODO Implementar opções para traço e help
if [ -n "$1" ]
then
	local=$1
	toRename
	cd ..
	local=$(basename "$local")
	rename.ul ' ' '_' "$local"
else
	local=$PWD
	toRename
fi

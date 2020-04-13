#!/bin/bash
#
# teps - Troca Espaço Por Sublinhado.
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
# This program exchanges spaces for underscores in file and directory names
# recursively within the given directory, including itself. If a name or
# path to a directory is not entered as a parameter, it will act in the
# current directory.
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
     Exchange Space for Underline.

     Exchanges spaces for underscores in file and directory names
     recursively within the given directory, including itself.
     If a name or path to a directory is not entered as a parameter,
     it will act in the current directory.

     Options:
       -s       explicitly define the underscore to replace spaces in names.
                The same as without informed option
       -t       define the dash to replace spaces in names
       -h       display this help and exit
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

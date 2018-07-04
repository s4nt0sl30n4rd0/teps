#!/bin/bash
#
# teps.sh - Troca Espaço Por Sublinhado.
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
# This program swaps spaces by underscores in filenames and directories
# recursively. If a name or path to a directory is not entered as a
# parameter, it will be executed in the user's home.
#
# -------------------------------------------------------------------------
#
# License:
#
#	General Public License 3.0
#
# -------------------------------------------------------------------------

space=1

toRename(){
	cd "$local" 2> /dev/null
	
	if [ $? -eq 0 ]
	then
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

if [ -n "$1" ]
then
	local=$1
	toRename
	cd ..
	local=$(basename "$local")
	rename.ul ' ' '_' "$local"
else
	local=$HOME
	toRename
fi

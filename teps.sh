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

#TODO Colocar dentro do if da toRename, antes do while

#TODO Criar variável que guardará o sublinhado ou traço

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

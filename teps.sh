#!/bin/bash
#
# teps.sh - Troca Espaço Por Sublinhado.
#
# Autor:
#	Leonardo Santos
#	<27875029+s4nt0sl30n4rd0@users.noreply.github.com>
#
# Manutenção:
#	Leonardo Santos
#	<27875029+s4nt0sl30n4rd0@users.noreply.github.com>
#
# -------------------------------------------------------------------------
#
# Este programa troca espaços em branco por sublinhados em nome de arquivos
# e diretórios recursivamente. Caso não seja passado um nome ou um caminho
# para um diretório como parametro, ele será executado no home do usuário.
#
# -------------------------------------------------------------------------
#
# Licença:
#
#	General Public License 3.0
#
# -------------------------------------------------------------------------

space=1

toRename(){
	cd "$local"
	
	while [ $space -ne 0 ]
	do
		find -print0 | xargs -0 rename 's/ /_/g' 2> /dev/null
		space=$(find | grep -c ' ')
	done
}

if [ -n "$1" ]
then
	local=$1
	toRename
	cd ..
	local=$(basename "$local")
	rename 's/ /_/g' "$local"
else
	local=$HOME
	toRename
fi

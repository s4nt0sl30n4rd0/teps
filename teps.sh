#!/bin/bash
#
# teps.sh - Troca Espaço Por Sublinhado.
#
# Autor:
#	Leonardo Santos <27875029+s4nt0sl30n4rd0@users.noreply.github.com>
#
# Manutenção:
#	Leonardo Santos <27875029+s4nt0sl30n4rd0@users.noreply.github.com>
#
# -------------------------------------------------------------------------
#
# Este programa troca espaços em branco por sublinhados em nome de arquivos
# e diretórios recursivamente.
#
# -------------------------------------------------------------------------
#
# Licença:
#
#	General Public License 3.0
#
# -------------------------------------------------------------------------

retorno=0

if [ -n $1 ]
then
	local=$1
else
	local=$HOME
fi

while [ $retorno -ne 1 ]
do
	find $local -type d,f -print0 | xargs -0 rename 's/ /_/g'
	find $local -type d,f | grep -c ' '
	retorno=$?
done

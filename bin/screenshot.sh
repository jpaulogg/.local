#!/bin/sh
set -f

cd "$HOME/imagens/"
output_file="${1:-screenshot}-$(date +%d-%m-%Y)"

while [ -f "${output_file}.png" ]; do
	output_file="${output_file%(*)}(${i=1})"
	i=$(( i + 1 ))
done

maim -sq ${output_file}.png \
	&& notify-send "Captura de tela bem sucedida: " \
                   "${output_file}.png" \
	|| notify-send "Captura de tela cancelada"

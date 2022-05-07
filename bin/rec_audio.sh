#!/bin/sh

cd $HOME/Músicas/

output_file="${1:-audio_rec}-$(date +%d-%m-%Y)"
pid_file='/tmp/pid2killmenu'

while [ -f "${file}.png" ]; do
	file="${file%(*)}(${i=1})"
	i=$(( i + 1 ))
done

notify-send -t 1000 'Inicializando gravação de áudio em 3 segundos'
sleep 1
notify-send -t 1000  'Inicializando gravação de áudio em 2 segundos'
sleep 1
notify-send -t 1000  'Inicializando gravação de áudio em 1 segundos'
sleep 1

ffmpeg \
	-f alsa -i default \
	-c:a flac \
	"$output_file" &

if [ $? -eq 0 ]; then
	echo $! > "$pid_file"
	exit 0
else
	notify-send 'Gravação de áudio cancelada' \
	exit 1
fi

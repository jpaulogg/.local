#!/bin/sh

cd $HOME/Vídeos/

output_file="${1:-video_rec}-$(date +%d-%m-%Y)"
pid_file='/tmp/pid2killmenu'

while [ -f "${file}.png" ]; do
	file="${file%(*)}(${i=1})"
	i=$(( i + 1 ))
done

notify-send 'Inicializando gravação de áudio em 3 segundos'
sleep 3

alias ffmpeg='ffmpeg \
	-f x11grab \
	-s "$(xdpyinfo | grep dimensions | awk '{ print $2 }')" \
	-i :0.0+1440,0 \
	-vf setpts=N/FR/TB'

only_video() {
	ffmpeg \
		-c:v libx264 -qp 0 -r 30 \
		"$output_file" &
}

audio_video() {
	ffmpeg \
		-f alsa -i default \
		-r 30 \
		-c:v h264 -crf 0 -preset ultrafast -c:a aac \
		"$output_file" &
}

if [ $? -eq 0 ]; then
	echo $! > "$pid_file"
	exit 0
else
	notify-send 'Gravação de áudio cancelada' \
	exit 1
fi

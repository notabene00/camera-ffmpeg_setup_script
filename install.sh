#!/bin/bash

# Git + инструменты для сборки
sudo apt-get install -y git pkg-config autoconf automake libtool libx264-dev

# AAC
git clone https://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
./autogen.sh
./configure --prefix=/usr/local --enable-shared --enable-static
make -j4
sudo make install
sudo ldconfig
cd ..

# FFMPEG
git clone https://github.com/FFmpeg/FFmpeg.git
cd FFmpeg
./configure --prefix=/usr/local --arch=armel --target-os=linux --enable-omx-rpi --enable-nonfree --enable-gpl --enable-libfdk-aac --enable-mmal --enable-libx264 --enable-decoder=h264 --enable-network --enable-protocol=tcp --enable-demuxer=rtsp
make -j4
sudo make install

# Плагин для homebridge
sudo npm i -g homebridge-camera-ffmpeg

# Прибираемся
cd ..
sudo rm -rf ./camera-ffmpeg_setup_script

# Предлагаем прописать уличную Питерскую камеру в конфиг
cat << EOF
Установка окончена!
В качестве пробного варианта можете прописать эту платформу в конфиг:

{
	"platform": "Camera-ffmpeg",
	"cameras": [
		{
			"name": "Питер",
			"videoConfig": {
				"source": "-rtsp_transport tcp -y -i rtsp://www.cactus.tv:1554/cam58",
				"maxBitrate": 1600,
				"maxStreams": 2,
				"maxWidth": 1920,
				"maxHeight": 1080,
				"vcodec": "h264_omx",
				"audio": false
			}
		}
	]
}

После этого не забудьте перезапустить homebridge.
Всего доброго!
EOF

# RPi homebridge-camera-ffmpeg setup script
Скрипт установки [homebridge-camera-ffmpeg  плагина](https://github.com/KhaosT/homebridge-camera-ffmpeg) для [homebridge](https://github.com/nfarina/homebridge) вместе с правильной сборкой [aac](https://github.com/mstorsjo/fdk-aac) и [ffmpeg](https://github.com/FFmpeg/FFmpeg) для [RPi](https://www.raspberrypi.org)

Итак, что же делает этот скрипт?

* Устанавливает git и инструменты для сборки
* Собирает и устанавливает [aac](https://github.com/mstorsjo/fdk-aac)
* Собирает и устанавливает [ffmpeg](https://github.com/FFmpeg/FFmpeg)
* Ставит сам [homebridge-camera-ffmpeg](https://github.com/KhaosT/homebridge-camera-ffmpeg) через npm
* Прибирается за собой
* По окончании сборки и установки, предлагает конфиг для платформы [homebridge-camera-ffmpeg](https://github.com/KhaosT/homebridge-camera-ffmpeg) с рабочей камерой для проверки

Внимание! Сборка ffmpeg занимает 40-60 минут. Это нормально. Имейте терпение :)

Так же, для работы этого плагина вам нужен, собственно, установленный [homebridge](https://github.com/nfarina/homebridge).

Если Dы не знаете что это, Вам это не надо %)

Как итог, запустив этот скрипт на Raspberry Pi, имеющем доступ в сеть, через час Вы получите готовый к использованию плагин для камер в homebridge.

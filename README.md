<!-- PROJECT SHIELDS -->

[![Maintenance](https://img.shields.io/badge/Maintained-yes-green.svg)](https://github.com/sebacipolat/app-score-monitor)
[![GitHub](https://img.shields.io/github/license/emalderson/ThePhish)](https://github.com/emalderson/ThePhish/blob/master/LICENSE)
[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome) [![Made With Love](https://img.shields.io/badge/Made%20With-Love-orange.svg)](https://github.com/chetanraj/awesome-github-badges)


<!-- PROJECT LOGO -->
<br />
<div align="center">
  
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://raw.githubusercontent.com/sebacipolat/android_screen_recorder/master/recorder_icon.png" alt="Logo"  height="200">
  </a>

  <h2 align="center">Android Screen Recorder</h3>

  <p align="center">
    Set de script para capturar en video la pantalla de un device android y superar la limitacion de 3 minutos del adb screenrecord
    <br />
    <br />
  </p>
</div>


<!-- ABOUT THE PROJECT -->
## Acerca De:
El mundo Android para poder capturar en video la pantalla de un device desde linea de comendas se utiliza [adb screenrecord ](https://developer.android.com/studio/command-line/adb#screenrecord) este pose una limitacion de tiempo maxima de 3 minutos por lo que no sirve para el uso en un CI en donde el proceso a grabar exceda este tiempo.
Cuando me tope con esta limitación puse manos a la obra y arme este set de script en bash linux que nos permitira superarlo.



<!-- Descripción -->
## Descripción
La solución consta de 3 scripts:

`recorder.sh`


   Este es el encargado de ejecutar el comando `adb screenrecord` de manera continua e ir generando los archivos de vide, crearalos archivos temporales 
   `pid.tmp`, `recorder.tmp`, los videos seran guardados en el device en la carpeta `/sdcard` con los nombre `record_video_<number>counter.mp4` 



`extract_videos.sh`


   Es el encargado de extraer los videos del device, creara una carpeta en la misma ubicacion del script llamada `videos`.
   Tambien es quien detendra la grabacion mediante
   
   

`file_merger.sh`


   En base a los videos extraidos por el script previo, realizara un merge de todos los videos utilizando la tool `ffmpeg`
   a un archivo final llamada `output.mp4`
   
   
   
   <!-- Usage -->
# Uso

## Inicio Captura

Para comenzar una grabación en un CI por ejemplo el comando `recorder.sh` debe ejecutarse en background ya que sino quedaria bloqueado el hilo de ejecución.
```sh
nohup sh recorder.sh &>/dev/null &
```

## Extracción de Videos

Cuando se dese detener la grabación y extraer los videos, deberemos ejecutar lo siguiente:
```sh
sh extract_videos.sh
```

## Unir Videos

Al terminar la extracción tendremos en la carpeta `/videos` la cantidad de videos que se hayan capturando
para poder unirlos deberemos ejecutar
```sh
sh file_merger.sh.sh
```


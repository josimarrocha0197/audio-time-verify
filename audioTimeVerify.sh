#!/bin/bash

baseDir=/home/josimar
audiosDir=/home/futurofone/monitor/2022/06/27/
audiosName=audiosName.txt
result=result.txt

cd $baseDir

rm -f $result

echo -e "Contabilizando quantidade de áudios... \n" >> $result

ls $audiosDir | grep ".mp3" > $audiosName

echo -e "Quantidade de áudios encontrados: `ls $audiosDir | grep ".mp3" | wc --lines` \n" >> $result

while read lines_loop
do
        echo -e "Áudio: $audiosDir"$lines_loop"" >> $result
        echo -e "Duraçao (em segundos): `mplayer -vo null -ao null -frames 0 -identify "$audiosDir"$lines_loop"" 2>/dev/null | grep ID_LENGTH  | cut -d'=' -f2` \n" >> $result
done < $audiosName

rm -f $audiosName
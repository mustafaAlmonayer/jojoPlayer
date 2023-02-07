#!/usr/bin/bash

if [ $1 = "play" ]
then
  name=$2$3
  ep=$4
  path=$(awk '/'"$name"'/, /end/' /home/mustafa/jojoPlayer/jojoPlayer.config)
  start=${#name}+1
  path=${path:${start}:-4}
  path=${path/'$ep'/"$ep"}
  echo "$path"
  smplayer -fullscreen "$path"
elif [ $1 = "add" ]
then
  echo "Add the absolute path where episodes live, ensure they all have the same path and the same name."
  echo 'the path should be in double quotations "put path here"'
  echo "The only limit in the name should be the episode ID."
  echo "put $ep where the episode number is"
  name=$2$3
  read fullPath
  echo "$name""$fullPath"'end' >> /home/mustafa/jojoPlayer/jojoPlayer.config
else
  echo "Script usage: "
  echo "             To play a series: jojoPlayer play name part episode"
  echo "             To add a series: jojoPlayer add"
  exit 1
fi


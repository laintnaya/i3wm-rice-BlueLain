#!/bin/sh


DIALOG_RESULT=$(echo ' log out\n hibernate\n reboot\n shutdown' | rofi -dmenu -i -p "[ EXIT ] : " -hide-scrollbar -tokenize -lines 4 -eh 2 -width 100 -padding 405 -opacity "95" -xoffset "0" -yoffset "0" -disable-history -font "Ubuntu 18")

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = " log out" ];
then
    i3-msg 'exit'
elif [ "$DIALOG_RESULT" = " hibernate" ];
then
    exec systemctl hibernate
elif [ "$DIALOG_RESULT" = " reboot" ];
then
    exec reboot
elif [ "$DIALOG_RESULT" = " shutdown" ];
then
    exec shutdown -h now
fi

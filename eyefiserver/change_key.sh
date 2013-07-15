#!/usr/bin/sh
key=$(/usr/bin/python /home/user/.config/maefi/update_key.py /home/user/.config/maefi/eyefiserver.conf $1)
echo -n $key > /home/user/.config/maefi/newkey.txt
exit 0

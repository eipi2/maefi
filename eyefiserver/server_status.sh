#!/usr/bin/sh

PROCESSCOUNT=$(ps -ef |grep -v grep |grep -cw eyefiserver.conf)

if [ $PROCESSCOUNT -eq 0 ]
then
echo "false" >&1
else
echo "true" >&1
fi

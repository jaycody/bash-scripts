#! /bin/sh


if [ "$1" = hq ]
then
	machineName=hq.machine.com
else
	machineName=mymachine.local
fi

ssh  me@${machineName} "ls /lab/ios-releases/particles-*"

echo "Which file to transfer? "
read ans

scp me@${machineName}:$ans ~/temp

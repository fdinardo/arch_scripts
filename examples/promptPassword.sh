
#!/bin/sh

USERNAME=$1

if [ $2 ]; then
	PSW=$2;
else
	echo -n "Password per l'email studenti: "
	stty -echo
	read PSW
	stty echo
	echo "" #-> Force \n to be output
fi

echo $PSW + $USERNAME


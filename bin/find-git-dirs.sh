#!/bin/bash

#====================================================================================
# NOTE: this script must to be aliased with 'source /path/to/this/script
#       to achieve the future of change directory in the terminal
#       Example: alias gitDirs='source /home/angelsoul/scripts/find-git-dirs.sh''
#====================================================================================

search()
{
	find $HOME -not -path '*/\.*/\.*' -name '.git' -prune 2>/dev/null >> "$fname"
	#"*/.git" -type d -prune 2>/dev/null >> "$fname"
}

spinner()
{
	local pid=$1
	local delay=0.2
	local spinstr='|/-\'
	while [ "$(ps a | awk '{print $1}' | grep $pid)" ];
	do
		local temp=${spinstr#?}
		printf " [%c]  " "$spinstr"
		local spinstr=$temp${spinstr%"$temp"}
		sleep $delay
		printf "\b\b\b\b\b\b"
	done
	printf "    \b\b\b\b"
}

move_to()
{
	#path=$(echo $1 | awk -F '/.git' '{print $1}')
	#cd "$path"
	path=$(dirname $1)
	cd $path
	pwd
}

declare -g fname;
fname="$HOME/result.tmp"
search "$fname" &
spinner $!

listString=$(cat "$fname" |tr "\n" " ")
list=($listString)
rm $fname

lLen=${#list[@]}

if (($lLen > 0)); then
	echo "Found: $lLen [OK]"

	for ((i=0; i<${lLen}; i++));
	do
		echo "[$i] -> ${list[$i]}"
	done

	echo -n "Pick index to go in that path: "
	read n

	if (($n >= $lLen)); then
		echo Index out of bound.
		return
	fi

	move_to "${list[$n]}"
else
	echo "No git Dirs found."
fi

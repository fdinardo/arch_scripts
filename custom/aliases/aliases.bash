# Definisco i miei alias personali

# Grub
alias grub-update='grub-mkconfig -o /boot/grub/grub.cfg'
alias grub-edit='sudo vi /etc/default/grub'

# System
alias uhalt='sudo halt'
alias ureboot='sudo reboot'
alias more='less'
alias mansys='man 2'
alias codname='lsb_release -a'
alias lh='ls -Ad .*'
alias df='df -h'
alias diff='diff -y --color=auto'

# Apps | Commands
alias vi='vim'
alias sudo='sudo '
alias gcc='gcc -fdiagnostics-color=auto '
alias gitDirs='source ~/myScripts/bin/find-git-dirs.sh'
alias aliasedit='echo opening ~/.bash_aliases; $EDITOR ~/.bash_aliases'
alias bashedit='echo opening ~/.bash_custom; $EDITOR ~/.bashrc_custom'

# PATHs
# Projects - Progetti
if [ -e $HOME/Projects ]; then
	alias myprojects='cd $HOME/Projects'
elif [ -e $HOME/Progetti ]; then
	alias myprojects='cd $HOME/Progetti'
fi
# Scrivania - Desktop
if [ -e $HOME/Scrivania ]; then
	alias desk='cd $HOME/Scrivania'
elif [ -e $HOME/Desktop ]; then
	alias desk='cd $HOME/Desktop'
fi
# Scaricati - Downloads
if [ -e $HOME/Scaricati ]; then
	alias downloads='cd $HOME/Scaricati'
elif [ -e $HOME/Downloads ]; then
	alias downloads='cd $HOME/Downloads'
fi

# Laravel
#if [ -e $HOME/Laravel ]; then
#	alias lara='cd $HOME/Laravel'
#fi

# MyScripts
if [ -e $HOME/myScripts/ ]; then
	alias myscripts='cd $HOME/myScripts/'
fi
if [ -e $HOME/myScripts/bin ];then
	alias myscripts-bin='cd $HOME/myScripts/bin/'
fi

#
# PACMAN aliases if it's installed
#
if pacman_loc="$(type -p "pacman")" || [ -n "$pacman_loc" ]; then
	alias autoremove='sudo pacman -R $(pacman -Qdtq)'
	alias autoclean='sudo pacman -Scc'
fi

#
# JAD reverse engeneering JAVA
#
if [ -e $HOME/JAD ]; then
	#alias jad='/home/angelsoul/Documenti/JAD/jad'
	alias jad='$HOME/JAD/jad'
	#alias openjadDir='cd /home/angelsoul/Documenti/JAD/JadFile'
	alias jad-dir='cd $HOME/JAD/JadFile'
fi

#
# Lampp bin alias
#
LAMPP_DIR=/opt/lampp/bin/
if [ -e "$LAMPP_DIR" ]; then
	alias lampp='sudo /opt/lampp/lampp'
	for item in $(ls $LAMPP_DIR); do
		if [ -f $LAMPP_DIR$item ]; then
			match=$(echo $item | grep -i "mysql")
			if [ -n $match ]; then
				alias_name="$item""_lampp";
				alias "$alias_name"="$LAMPP_DIR$item"
			fi
		fi
	done
fi

#
# Android-Studio tools aliases
#
ANDROID_DIR=$HOME/Android/Sdk/platform-tools/
if [ -e "$ANDROID_DIR" ]; then
	for item in $(ls $ANDROID_DIR); do
		match=$(echo $item | grep "\.")
		if [ -z $match ]; then
			if [ -f $ANDROID_DIR$item ]; then
  				alias "$item"="$ANDROID_DIR$item"
			fi
		fi
	done
fi

#
# Homestead
#
HOMESTEAD_PATH=$HOME/.homestead
if [ -e ${HOMESTEAD_PATH} ]; then
	alias homestead-edit="$EDITOR $HOMESTEAD_PATH/Homestead.yaml"
fi

#
# PHP
#
alias php='php -dzend_extension=xdebug.so'
if [ $(type -P phpunit) ];then
	alias phpunit='php $(which phpunit)'
fi

#
# This is used in combination with curl
# curl <address> | prettify
#
alias prettify="python -mjson.tool"

#
# Xclip - it depends by Xorg
# @NOTE: If I use Wayland this shouldn't work.
#
if [ $(type -P xclip) ];then
	alias sshkey="cat ~/.ssh/id_rsa.pub | xclip -sel clip && echo 'Copied to the clipboard'"
fi

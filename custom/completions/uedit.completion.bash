_uedit()
{

	 local cur=${COMP_WORDS[COMP_CWORD]}
	 local list_path=$(echo $PATH | tr ":" "\n")
	 local list_files="$(ls -A)"

	 case "$cur" in
	 	/) #TODO: fix caso in cui voglio inserire il path
	 		COMPREPLY=()
	 		return 0
	 		;;
	 	*)
	 		for myPath in $list_path
	 		do
	 			list_files="$list_files $(ls $myPath -1 2> /dev/null)"
	 		done
	 		COMPREPLY=( $(compgen -W "$list_files" -- $cur) )
	 		return 0
	 		;;
	 esac
}
complete -F _uedit uedit


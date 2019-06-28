

_eng()
{
	local cur=${COMP_WORDS[COMP_CWORD]}
	local list_path=$(echo $PATH | tr ":" "\n")

	case "$cur" in
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

complete -F _eng eng

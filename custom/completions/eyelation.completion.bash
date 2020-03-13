
_eyelation()
{
	local cur=${COMP_WORDS[COMP_CWORD]}
	local projects=$(ls -1 $HOME/git/eyelation/)

	case "$cur" in
		*)
			COMPREPLY=( $(compgen -W "$projects" -- $cur) )
			return 0
			;;
	esac
}

complete -F _eyelation eyelation

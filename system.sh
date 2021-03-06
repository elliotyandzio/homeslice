
# mkdir -p, then cd into it

function mkcd {
	test -z $1 && echo "You must specify a folder to create, idiot" >&2 && return
	mkdir -p $1
	cd $1
}

# show your top git commands

function topcmd {
	history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# show @todo tags in the project dir

# function todolist {
	# grep -rn "@todo" . | awk -F ":" '$$1 != "./Makefile" {print $$3; print $$1 $$2  }'
# }

alias sthost='st /etc/hosts'
alias stz='st ~/.zshrc'

# sudo the last command
alias ffs='sudo $(fc -ln -1)'

function ansicolours {
	# http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

	#
	#   This file echoes a bunch of color codes to the
	#   terminal to demonstrate what's available.  Each
	#   line is the color code of one forground color,
	#   out of 17 (default + 16 escapes), followed by a
	#   test use of that color on all nine background
	#   colors (default + 8 escapes).
	#

	T='gYw'   # The test text

	echo -e "\n                 40m     41m     42m     43m\
	     44m     45m     46m     47m";

	for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
	           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
	           '  36m' '1;36m' '  37m' '1;37m';
	  do FG=${FGs// /}
	  echo -en " $FGs \033[$FG  $T  "
	  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
	    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
	  done
	  echo;
	done
	echo
}

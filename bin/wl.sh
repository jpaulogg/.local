#!/bin/sh

usage(){
	cat <<-EOF
	usage: ${0##*/} [-m lentgh] [-W] [-w].
	Reads standard input and prints a list of words/WORDS
	to standard output.
	EOF
 }

MINLENGTH=4
LONGWORD=0

while [ $# -gt 0 ]; do
	case "$1" in
		-m) MINLENGTH=$2; shift ;;
		-W) LONGWORD=1 ;;
		-w) LONGWORD=0 ;;
		*) usage; exit 1 ;;
	esac
	shift
done

if [ $LONGWORD = 0 ]; then
	tr -s '[:blank:][:punct:]' '\n'
else
	tr -cs '[:alpha:]:._-' '\n'
fi \
	| grep ".\{$MINLENGTH,\}" \
	| sed "/[^aeiou:._-]\{4,\}/d" \
	| sort -u

#!/bin/bash
#set -Ceu
#-----------------------------------------------------------------------------
# ANSI Escape Codeにおける3bitカラーコードを出力する。
# Created: 2021-05-30T09:27:40+0900
#-----------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	ARG_FORE_GROUND=; ARG_BACK_GROUND=; ARG_FORE_COLOR=7; ARG_BACK_COLOR=0;
	while getopts :f:b:F:B: OPT; do
	case $OPT in
		f) ARG_FORE_GROUND=3;  ARG_FORE_COLOR=$OPTARG;;
		b) ARG_BACK_GROUND=4;  ARG_BACK_COLOR=$OPTARG;;
		F) ARG_FORE_GROUND=9;  ARG_FORE_COLOR=$OPTARG;;
		B) ARG_BACK_GROUND=10; ARG_BACK_COLOR=$OPTARG;;
		*) eval "echo \"$(cat "$HERE/help.txt")\""
	esac
	done
	shift $((OPTIND - 1))

	[ $# -eq 1 ] && { ARG_FORE_GROUND=3; ARG_FORE_COLOR=$1; }
	[ $# -eq 2 ] && { ARG_FORE_GROUND=3; ARG_FORE_COLOR=$1; ARG_BACK_GROUND=4; ARG_BACK_COLOR=$2; }

	GetColorId() {
		case $1 in
			0|k|K|black)   echo '0';;
			1|r|R|red)     echo '1';;
			2|g|G|green)   echo '2';;
			3|y|Y|yellow)  echo '3';;
			4|b|B|blue)    echo '4';;
			5|m|M|magenta) echo '5';;
			6|c|C|cyan)    echo '6';;
			7|w|W|white)   echo '7';;
			*)             { echo 'エラー。色は数値(0-7)か字(k,r,g,y,b,m,c,w)か名前(black,red,green,yellow,blue,magenta,cyan,white)を指定してください。'; exit; };;
		esac
	}
	FORE_COLOR="$ARG_FORE_GROUND$(GetColorId $ARG_FORE_COLOR)"
	BACK_COLOR="$ARG_BACK_GROUND$(GetColorId $ARG_BACK_COLOR)"
	[ -n "$ARG_FORE_GROUND" ] && [ -n "$ARG_BACK_GROUND" ] && echo "$FORE_COLOR;$BACK_COLOR"
	[ -n "$ARG_FORE_GROUND" ] && [ -z "$ARG_BACK_GROUND" ] && echo "$FORE_COLOR"
	[ -z "$ARG_FORE_GROUND" ] && [ -n "$ARG_BACK_GROUND" ] && echo "$BACK_COLOR"
	[ -z "$ARG_FORE_GROUND" ] && [ -z "$ARG_BACK_GROUND" ] && exit
}
Run "$@"

#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# 3bitカラーの糖衣構文ツールをつくる。
# CreatedAt: 2021-06-02
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	COLOR3="$HERE/color3.sh"
	echo $("$COLOR3" yellow red)
	echo -e "\e[$("$COLOR3" yellow red)m文字色＝黄、背景色＝赤\e[m"
	echo -e "\e[$("$COLOR3" y r)m文字色＝黄、背景色＝赤\e[m"
	echo -e "\e[$("$COLOR3" 3 1)m文字色＝黄、背景色＝赤\e[m"
	echo -e "\e[$("$COLOR3" -F 3)m文字色＝明黄\e[m"
	echo -e "\e[$("$COLOR3" -b 1)m背景色＝赤\e[m"
	echo -e "\e[$("$COLOR3" -B 1)m背景色＝明赤\e[m"

	Color3() { echo -e "\e[$("$COLOR3" ${@:2})m$1\e[m"; }
	Color3 '文字色＝黄、背景色＝赤' yellow red
	Color3 '文字色＝黄、背景色＝赤' y r
	Color3 '文字色＝黄、背景色＝赤' 3 1
	Color3 '文字色＝明黄' -F 3
	Color3 '背景色＝赤' -b 1
	Color3 '背景色＝明赤' -B 1
	cd "$HERE"
}
Run "$@"

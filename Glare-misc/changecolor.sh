#!/bin/sh
if [ ! -t 0 ]; then
	x-terminal-emulator -e "$0"
	exit 0
fi
basedir="$(dirname "$(readlink -f "${0}")")"
cd "$basedir"
command -v convert >/dev/null 2>&1 || { echo >&2 "I require ImageMagick >= 6.7.7 but it's not installed.  Aborting."; exit 1; }
command -v sed >/dev/null 2>&1 || { echo >&2 "I require sed but it's not installed.  Aborting."; exit 1; }
command -v bc >/dev/null 2>&1 || { echo >&2 "I require bc >= 1.06 but it's not installed.  Aborting."; exit 1; }
command -v tr >/dev/null 2>&1 || { echo >&2 "I require tr >= 8 but it's not installed.  Aborting."; exit 1; }
if type yad >/dev/null 2>&1; then
	newcolor=$(yad --color --init-color=#407dec --title="Please select a new #RRGGBB hilight color")
elif type qarma >/dev/null 2>&1; then
	newcolor=$(qarma --color-selection --color=#407dec --title="Please select a new #RRGGBB hilight color")
else
	read -p "Please enter your new hilight color in #RRGGBB(#407dec is currently set): " newcolor
fi
if [ "$newcolor" = "" ]; then
	printf "no color was was selected, aborting!"
	exit 1
fi
###convert hex to rgb
newcolorhexup=`echo "$newcolor" | sed 's/#//' | tr '[:lower:]' '[:upper:]'`
rhex=`echo $newcolorhexup | cut -c-2`
ghex=`echo $newcolorhexup | cut -c3-4`
bhex=`echo $newcolorhexup | cut -c5-6`
r=`echo "ibase=16; $rhex" | bc`
g=`echo "ibase=16; $ghex" | bc`
b=`echo "ibase=16; $bhex" | bc`
newcolorrgb="$r,$g,$b"
###
echo "This may take a while"
find "$basedir" -type f -exec sed -i 's/#407dec/'$newcolor'/g' {} \;
find "$basedir" -type f -exec sed -i 's/64,125,236/'$newcolorrgb'/g' {} \;
##todo add zip/7z to recolor the winamp skin
echo "done"
sleep 3

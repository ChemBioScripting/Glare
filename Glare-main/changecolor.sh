#!/bin/sh
if [ ! -t 0 ]; then
	x-terminal-emulator -e "$0"
	exit 0
fi
basedir="$(dirname "$(readlink -f "${0}")")"
cd "$basedir"
type convert >/dev/null 2>&1 || { echo >&2 "I require ImageMagick but it's not installed.  Aborting.";sleep 5;exit 1; }
type sed >/dev/null 2>&1 || { echo >&2 "I require sed but it's not installed.  Aborting.";sleep 5;exit 1; }
type bc >/dev/null 2>&1 || { echo >&2 "I require bc but it's not installed.  Aborting.";sleep 5;exit 1; }
type tr >/dev/null 2>&1 || { echo >&2 "I require tr but it's not installed.  Aborting.";sleep 5;exit 1; }
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
newcolorhexup=$(echo "$newcolor"|sed 's/#//'|tr '[:lower:]' '[:upper:]')
rhexup=$(echo $newcolorhexup|cut -c-2)
ghexup=$(echo $newcolorhexup|cut -c3-4)
bhexup=$(echo $newcolorhexup|cut -c5-6)
r=$(echo "ibase=16; $rhexup"|bc)
g=$(echo "ibase=16; $ghexup"|bc)
b=$(echo "ibase=16; $bhexup"|bc)
newcolorrgb="$r,$g,$b"
echo "This may take a while"
find "$basedir" -type f -exec sed -i 's/#407dec/'$newcolor'/g' {} \;
find "$basedir" -type f -exec sed -i 's/64,125,236/'$newcolorrgb'/g' {} \;
find "$basedir" -type f -name '*active.png' -not -name "*inactive.png" -not -path "*cupertino*" -exec convert {} -define png:format=png32 -fill "$newcolor" -opaque "#407dec" {} \;
###the openbox theme needs some extras
rdark=$(expr $r - 30)
gdark=$(expr $g - 30)
bdark=$(expr $b - 30)
if [ "$rdark" -lt "0" ]; then
	rdark=$(expr $rdark - $rdark)
fi
if [ "$gdark" -lt "0" ]; then
	gdark=$(expr $gdark - $gdark)
fi
if [ "$bdark" -lt "0" ]; then
	bdark=$(expr $bdark - $bdark)
fi
rhexdark=$(echo "obase=16; $rdark"|bc)
ghexdark=$(echo "obase=16; $gdark"|bc)
bhexdark=$(echo "obase=16; $bdark"|bc)
find "$basedir" -type f -name "themerc" -exec sed -i "s#rgb:40/7d/ec#rgb:$rhexup\/$ghexup\/$bhexup#g" {} \;
find "$basedir" -type f -name "themerc" -exec sed -i "s#rgb:32/62/b9#rgb:$rhexdark\/$ghexdark\/$bhexdark#g" {} \;

echo "done"
sleep 3

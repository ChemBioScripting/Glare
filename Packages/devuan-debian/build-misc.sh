 #!/bin/sh
pkgname="x11-gui-theme-glare-misc"
pkgver=$(date -u +%Y%m%d.%H%M%S)
pkgsection="x11"
pkgmakedepends="subversion bc imagemagick"
pkgshortdesc="misc Glare themes"
pkgdepends=""
pkgconflicts=""
pkgreplaces=""
pkgprovides=""
pkgrecommends=""
pkgsuggests="audacious qmmp qt4-style-kvantum qt5-style-kvantum compton"
build(){
	svn co https://github.com/sixsixfive/Glare/trunk/Glare-misc "$builddir" --config-dir /tmp
	mkdir -p "$filedir"/usr/share/themes/Glare-Misc
	mv "$builddir"/* "$filedir"/usr/share/themes/Glare-Misc
#kvantum
	mkdir -p "$filedir"/usr/share/Kvantum
	cd "$filedir"/usr/share/Kvantum
	ln -s ../themes/Glare-Misc/Kvantum/Glare
#kde colors
	mkdir -p "$filedir"/usr/share/kde4/apps/color-schemes
	cd "$filedir"/usr/share/kde4/apps/color-schemes
	ln -s ../../../themes/Glare-Misc/kde-colorscheme/Glare.colors
#lxqt
	mkdir -p "$filedir"/usr/share/lxqt/themes
	cd "$filedir"/usr/share/lxqt/themes
	ln -s ../../themes/Glare-Misc/lxqt/Glare
#qmmp
	mkdir -p "$filedir"/usr/share/qmmp/skins
	#qmmp can't read symlinks...
	cp "$filedir"/usr/share/themes/Glare-Misc/winamp2.x/Glare-qmmp.wsz "$filedir"/usr/share/qmmp/skins/Glare.wsz
#audacious
	mkdir -p "$filedir"/usr/share/audacious/Skins
	cd "$filedir"/usr/share/audacious/Skins
	ln -s ../../themes/Glare-Misc/winamp2.x/Glare.wsz
#mozilla
	mkdir -p "$filedir"/usr/share/mozilla/extensions
	cd "$filedir"/usr/share/mozilla/extensions
	mkdir {ec8030f7-c20a-464f-9b0e-13a3a9e97384}
	cd {ec8030f7-c20a-464f-9b0e-13a3a9e97384}
	ln -s ../../../themes/Glare-Misc/mozilla/glarebold GlareBold@ssfgh.com
	mkdir ../{92650c4d-4b8e-4d2a-b7eb-24ecf4f6b63a}
	cd ../{92650c4d-4b8e-4d2a-b7eb-24ecf4f6b63a}
	ln -s ../../../themes/Glare-Misc/mozilla/glarebold GlareBold@ssfgh.com
	mkdir ../{3550f703-e582-4d05-9a08-453d09bdfdc6}
	cd ../{3550f703-e582-4d05-9a08-453d09bdfdc6}
	ln -s ../../../themes/Glare-Misc/mozilla/glarebold GlareBold@ssfgh.com
#walls
	mkdir -p "$filedir"/usr/share/backgrounds
	cd "$filedir"/usr/share/backgrounds
	ln -s ../themes/Glare-Misc/wppatterns/Glare_pattern_dark-01.png
	ln -s ../themes/Glare-Misc/wppatterns/Glare_pattern_trans-01.png
	mkdir -p "$filedir"/usr/share/wallpapers
	cd "$filedir"/usr/share/wallpapers
	ln -s ../themes/Glare-Misc/wppatterns/Glare_pattern_dark-01.png
	ln -s ../themes/Glare-Misc/wppatterns/Glare_pattern_dark-01.png.desktop
	##kde desktop is too limited for this
	#ln -s ../themes/Glare-Misc/wppatterns/Glare_pattern_trans-01.png
	#ln -s ../themes/Glare-Misc/wppatterns/Glare_pattern_trans-01.png.desktop
##configs
#compton
	mkdir -p "$filedir"/etc/xdg
	cd "$filedir"/etc/xdg
	mv ../../usr/share/themes/Glare-Misc/compton-config/compton.conf compton.conf
#trolltech
	mv ../../usr/share/themes/Glare-Misc/qt4-colorscheme/Trolltech.conf Trolltech.conf
#kvantum
	mkdir ../kvantum/
	printf "[General]\ntheme=Glare" > ../kvantum/kvantum.kvconfig
#colorchange
	cd "$filedir"/usr/share/themes/Glare-Misc
	printf "Would you like to change the highlight/selection color now?: [y/N] \n"
	read input
	case $input in
		[yY])
			printf "executing color script.\n"
			./changecolor.sh;;
		*)
			printf "skipped\n";;
	esac
}

########################################################################
(type aptitude >/dev/null 2>&1) || \
{ echo >&2 "I require aptitude, but it's not installed. aborting!";exit 1;}
(type su-to-root >/dev/null 2>&1) || \
{ echo >&2 "I require menu, but it's not installed. aborting!";exit 1;}
scriptdepends="debhelper dpkg-dev fakeroot build-essential sed gawk grep findutils binutils \
coreutils libfile-fcntllock-perl"
basedir="$(dirname "$(readlink -f "${0}")")/build-$pkgname"
builddir="$basedir"/build
debfolder="$basedir"/debian
filedir="$basedir"/files
mkdir -p "$basedir" "$builddir" "$filedir"
mkdir -p "$debfolder"/source
date=$(date '-R')

create_debfiles() {
	cat <<EOF > "$debfolder"/control
Source: $pkgname
Section: $pkgsection
Priority: optional
Maintainer: $USER <$USER@$(cat /etc/hostname)>
Build-Depends: debhelper (>= 7) 
Standards-Version: 3.9.6

Package: $pkgname
Architecture: $(dpkg-architecture -qDEB_HOST_ARCH)
Conflicts: $(echo "$pkgconflicts" | sed 's# #, #g')
Replaces: $(echo "$pkgreplaces" | sed 's# #, #g')
Depends: $(echo "$pkgdepends" | sed 's# #, #g')
Recommends: $(echo "$pkgrecommends" | sed 's# #, #g')
Suggests: $(echo "$pkgsuggests" | sed 's# #, #g')
Provides: $(echo "$pkgprovides" | sed 's# #, #g')
Description: $pkgshortdesc
EOF
	cat <<EOF > "$debfolder"/rules
#!/usr/bin/make -f

build: build-arch build-indep
build-arch: build-stamp
build-indep: build-stamp

build-stamp: 
	dh_testdir
	touch build-stamp

clean:
	dh_testdir
	dh_testroot
	rm -f build-stamp 
	dh_clean

install: build
	dh_testdir
	dh_testroot
	dh_prep
	dh_installdirs
	mv "$basedir"/files/* "$debfolder/$pkgname"
	
binary-indep: build install
	dh_testdir
	dh_testroot
	dh_installdocs
	dh_installchangelogs 
	dh_fixperms
	dh_compress
	dh_installdeb
	dh_gencontrol
	dh_md5sums
	dh_builddeb
	dh_clean

binary: binary-indep binary-arch
.PHONY: build clean binary-indep binary-arch binary install
EOF
	cat <<EOF > "$debfolder"/changelog
$pkgname ($pkgver-1) unstable; urgency=low
   new upsteam release
 -- $USER <$USER@$(cat /etc/hostname)>  $date
EOF
	chmod +x "$debfolder"/rules
	printf "3.0 (native)\n" > "$debfolder/source/format"
	printf "7\n" > "$debfolder/compat"
}
install_depends() {
	dpkg --get-selections | awk '{if ($2 == "install") print $1}' > "$basedir"/installed
	printf "trying to install build dependencies\n"
	su-to-root -c "aptitude update; aptitude -Ry install $pkgmakedepends $pkgdepends $scriptdepends"
	dpkg --get-selections | awk '{if ($2 == "install") print $1}' > "$basedir"/installed-new
}
clean(){
	pkgdiff=$(diff installed installed-new | grep ">" | tr "\n" " " | sed -e 's/> //' -e 's/ > / /g')
	if [ ! -z "$pkgdiff" ]; then
		printf "trying to remove build dependencies\n"
		su-to-root -c "apt-get -m remove $pkgdiff"
	fi
	if [ ! -z "$basedir" ]; then
		rm -rf "$basedir"
	fi
}
package() {
	fakeroot debian/rules binary
}
if [ ! -t 0 ]; then
	x-terminal-emulator -e "$0"
	exit 0
fi
install_depends
create_debfiles
cd "${builddir}";build
cd "${basedir}";package
hostarch=$(dpkg-architecture -qDEB_HOST_ARCH)
cd "${basedir}";clean
if [ -f ../${pkgname}_${pkgver}-1_${hostarch}.deb ]; then
printf "Would you like to install the package now? [N/y]"; read ny
	case $ny in
		[Yy])
			su-to-root -c "dpkg -i ../${pkgname}_${pkgver}-1_${hostarch}.deb;apt-get install -f"
			printf "Would you like to delete the deb now? [n/Y]"; read yn
			case $yn in
				[Nn])
					printf "skipped\n";;
				*)
					rm -f "../${pkgname}_${pkgver}-1_${hostarch}.deb";;
			esac;;
		*)
			printf "skipped\n";;
	esac
fi
printf "\n\n\ndone\n\n\n"
sleep 5
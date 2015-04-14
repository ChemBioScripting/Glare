#!/bin/sh
pkgname="x11-icon-theme-ivy"
pkgver=$(date -u +%Y%m%d.%H%M%S)
pkgsection="x11"
pkgmakedepends="git"
pkgshortdesc="A very minimalistic tango like icon theme"
pkgdepends="hicolor-icon-theme"
pkgconflicts=""
pkgreplaces=""
pkgprovides=""
pkgrecommends=""
pkgsuggests=""
build(){
	git clone --depth 1 -b master https://github.com/sixsixfive/ivy.git "$builddir"
	mkdir -p "$filedir"/usr/share/icons
	mv "$builddir"/Ivy "$filedir"/usr/share/icons/Ivy
	mv "$builddir"/misc/Ivy-MATE "$filedir"/usr/share/icons/Ivy-MATE
	mv "$builddir"/misc/Ivy-LXQt "$filedir"/usr/share/icons/Ivy-LXQt
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
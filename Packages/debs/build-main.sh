 #!/bin/sh
pkgname="x11-gui-theme-glare-main"
pkgver=$(date -u +%Y%m%d.%H%M%S)
pkgsection="x11"
pkgmakedepends="subversion bc imagemagick"
pkgshortdesc="A simple and bright theme"
pkgdepends="gtk2-engines-pixbuf gtk2-engines"
pkgconflicts=""
pkgreplaces=""
pkgprovides=""
pkgrecommends=""
pkgsuggests="libgtk-3-0 xfwm4 marco muffin \
openbox xfce4-notifyd x11-icon-theme-ivy x11-gui-theme-glare-misc"
build() {
	svn co https://github.com/sixsixfive/Glare/trunk/Glare-main "$builddir" --config-dir /tmp
	mkdir -p "$filedir"/usr/share/themes/Glare
	mv "$builddir"/* "$filedir"/usr/share/themes/Glare
	cd "$filedir"/usr/share/themes
	ln -s Glare/extras/wmthemes/Glare-cupertino
	ln -s Glare/extras/wmthemes/Glare-cupertino-dusK-x1.5
	ln -s Glare/extras/wmthemes/Glare-cupertino-dusK
	ln -s Glare/extras/wmthemes/Glare-cupertino-windowck
	ln -s Glare/extras/wmthemes/Glare-windowck
	ln -s Glare/extras/wmthemes/Glare-compact
	mkdir -p "$filedir"/etc/gtk-2.0
	cat <<EOF > "$filedir"/etc/gtk-2.0/gtkrc
include "/usr/share/themes/Glare/gtk-2.0/gtkrc"
gtk-icon-theme-name="Ivy"
gtk-fallback-icon-theme="hicolor"
gtk-toolbar-style=GTK_TOOLBAR_ICONS
EOF
	mkdir -p "$filedir"/etc/gtk-3.0
	cat <<EOF > "$filedir"/etc/gtk-3.0/settings.ini
[Settings]
gtk-theme-name=Glare
gtk-icon-theme-name=Ivy
gtk-application-prefer-dark-theme=false
gtk-button-images=true
gtk-menu-images=true
EOF
	cd "$filedir"/usr/share/themes/Glare
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
	su-to-root -c "aptitude update; aptitude -R install $pkgmakedepends $pkgdepends $scriptdepends"
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
cd "${basedir}"
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
clean
printf "\n\n\ndone\n\n\n"
sleep 5
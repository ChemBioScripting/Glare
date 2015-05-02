just some scripts to build deb packages - they should work on any debian based distro as long aptitude and menu is installed

Also note: if you install these packages: Glare will be set as the default widget style for gtk2, gtk3 & qt(only if you installed the kvantum packages from here) to disable this remove the following files:

* gtk2: /etc/gtk-2.0/gtkrc
* gtk3: /etc/gtk-3.0/settings.ini
* qt/kvantum: /etc/kvantum/kvantum.kvconfig
###Install(eg: systemwide install with sysprefix /usr)

*NOTE: linking is prefered due easier updating(svn up .)*

- Open a Terminal, become root and get the theme: 

```
svn co https://github.com/sixsixfive/Glare/trunk/Glare-misc /usr/share/themes/Glare-misc
```
- If wanted change the highlight color
 * needs sed, imagemagick(convert), bc, and find! - you may should install [yad](http://sourceforge.net/projects/yad-dialog) or [qarma](https://github.com/luebking/qarma), too

```
sh /usr/share/themes/Glare-misc/changecolor.sh
```
- Kvantum theme

```
ln -s /usr/share/themes/Glare-misc/Kvantum/Glare /usr/share/Kvantum/Glare
```

- KDE color scheme(this is needed for many KDE-Apps) 

```
ln -s /usr/share/themes/Glare-misc/Kvantum/Glare/configs/Glare.colors /usr/share/kde4/apps/color-schemes/Glare.colors
```
 
- LXQt theme

```
ln -s /usr/share/themes/Glare-misc/lxqt/Glare /usr/share/lxqt/themes/Glare
```
- Qmmp

```
cp /usr/share/themes/Glare-misc/qmmp/Glare.wsz /usr/share/qmmp/skins/Glare.wsz
```
- Audacious

```
ln -s /usr/share/themes/Glare-misc/qmmp/non-branded/Glare.wsz /usr/share/audacious/Skins/Glare.wsz
```
- Promoe

```
cd /usr/share/promoe/skins
7z x /usr/share/themes/Glare-misc/qmmp/non-branded/Glare.wsz -oGlare
```
- XUL
  * just drag and drop the xpi into firefox

###Setting the theme:

#### Kvantum

* There is also a Trolltech.conf(Qt4 color scheme) in the Kvantum/configs folder
just replace your local($HOME/.config/Trolltech.conf) file.
(It will be updated next time you run a Qt4 app like qtconfig)

* Make sure you set QT_STYLE_OVERRIDE to kvantum eg:

```
printf "export QT_STYLE_OVERRIDE=kvantum\n" >>$HOME/.profile
```
or

```
printf "export QT_STYLE_OVERRIDE=kvantum\n" >>$HOME/.xinitrc
```

* Don't forget to set your Kvantum theme eg::

```
printf "\x5BGeneral\x5D\ntheme=Glare" > ~/.config/Kvantum/kvantum.kvconfig
```
#### FAQ:

##### Qt5 application looks weird?

try to force your application to use the kvantum theme eg:

    QT_STYLE_OVERRIDE=kvantum screengrab

Note: keep in mind that you need to complile the kvantum style pugin for every architecture eg: in the worst case you will need kvantum-qt4:i386, kvantum-qt5:i386, kvantum-qt4:amd64, kvantum-qt5:amd64)

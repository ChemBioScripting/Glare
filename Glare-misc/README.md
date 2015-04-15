###Install(eg: systemwide install with sysprefix /usr)

*NOTE: linking is prefered due easier updating(svn up .)*

- Get the themes: 

```
svn co https://github.com/sixsixfive/Glare/trunk/Glare-misc /usr/share/themes/Glare-misc
```
- If wanted change the highlight color execute the color script!
 * needs sed, imagemagick(convert), bc, and find! - you may should install [yad](http://sourceforge.net/projects/yad-dialog) or [qarma](https://github.com/luebking/qarma), too


### theme dirs:

- Kvantum theme

```
/usr/share/Kvantum/<themedir>
~/.config/Kvantum/<themedir>

```
- KDE color scheme(this is needed for many KDE-Apps) 

```
/usr/share/apps/color-schemes/<theme>.colors
~/.kde/share/apps/color-schemes/<theme>.colors
- Qt4 color scheme

```
/etc/xdg/Trolltech.conf
~/.config/Trolltech.conf<theme>

```
- KDE settings(only if there is no kde installed)

```
~/.kde/share/config/kdeglobals

```
- very simple compton settings

```
/etc/xdg/compton.conf
~/.compton.conf

```
- LXQt theme

```
/usr/share/lxqt/themes/<themedir>
```
- Qmmp

```
/usr/share/qmmp/skins/<theme>.wsz
```
- Audacious

```
/usr/share/audacious/Skins/<theme>.wsz
```
- Promoe(wsz needs to be unpacked)

```
/usr/share/promoe/skins/<themedir>
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

###Install(eg as user)

- Open a terminal, enter the theme dir: `cd ~/.themes` and get the theme: 

```svn co https://github.com/sixsixfive/Glare/trunk/Glare-main Glare```

- Link the extra WM themes: 

```
ln -s Glare/extras/wmthemes/Glare-cupertino
ln -s Glare/extras/wmthemes/Glare-cupertino-dusK
ln -s Glare/extras/wmthemes/Glare-cupertino-dusK-x1.5-test
ln -s Glare/extras/wmthemes/Glare-compact
```

- If you have the [Windowck plugin](http://goodies.xfce.org/projects/panel-plugins/xfce4-windowck-plugin) installed you can also link those two extra themes: 

```
ln -s Glare/extras/wmthemes/Glare-windowck
ln -s Glare/extras/wmthemes/Glare-cupertino-windowck
```
- If you want to change the blue highlight color to something else: 

 * needs sed, imagemagick(convert), bc, and find! - you may should install [yad](http://sourceforge.net/projects/yad-dialog) or [qarma](https://github.com/luebking/qarma), too

```
sh ~/.themes/Glare/changecolor.sh
```
*Note Keep in mind that this is the hilight/selection color so since the highlight text is white you should choose something not so bright!*

#### Setting the theme
##### xfconf(Xfce only):

```
xfconf-query -c xsettings -p /Net/ThemeName -s Glare
xfconf-query -c xfce4-notifyd -p /theme -s Glare
xfconf-query -c xfwm4 -p /general/theme -s Glare
```
#####manually

for GTK2 create a file ~/.gtkrc-2.0 with the following content:

```
include "~/.themes/Glare/gtk-2.0/gtkrc"
gtk-icon-theme-name="Ivy"
gtk-fallback-icon-theme="tango"
gtk-toolbar-style=GTK_TOOLBAR_ICONS
```

for GTK3 create a file ${XDG_CONFIG_HOME}/gtk-3.0/settings.ini with the following content:

```
[Settings]
gtk-theme-name=Glare
gtk-icon-theme-name=Ivy
gtk-application-prefer-dark-theme=false
gtk-button-images=true
gtk-menu-images=true
```
*Note there are many more settings for each GTK toolkit: [GTK2](https://developer.gnome.org/gtk2/stable/GtkSettings.html#GtkSettings.properties), [GTK3](https://developer.gnome.org/gtk3/stable/GtkSettings.html#GtkSettings)*

### FAQ:

##### Before any questions please have a look into the settings file!

    ${themedir}/Glare/gtk-2.0/settings.ini
    ${themedir}/Glare/gtk-3.0/settings.css

#### Xfce/Xfwm

##### How can I resize the cupertino theme with no sideborders?

use your window modifier key(default ALT) + LMB(for dragging) and RMB(for resizing)

##### How to use the cupertino theme without Composite?

since this theme has no side borders it's recommend to use composite(shadows)
but you can also disable the composite, just remove the following line from
the ${themedir}/Glare-cupertino/xfwm4/themerc

```
use_compositing=true
```
##### Xfce themes have no smart placement mode, all windows open centered?

remove the following lines from the ${themedir}/${subthemedir}/xfwm4/themerc

```
placement_mode=center
placement_ratio=100
```
####KDE

##### Wrong GTK2 background color in KDE?

make sure you disabled "apply colors to non KDE apps" (syssettings>colors>options)

####GNOME 3

GNOME isn't supported!

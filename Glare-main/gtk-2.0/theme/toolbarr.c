style"gtktoolbar"{
xthickness=1
ythickness=1
GtkToolbar::shadow-type=GTK_SHADOW_NONE
GtkToolbar::space-style=GTK_TOOLBAR_SPACE_LINE
GtkToolbar::space-size=5
GtkToolbar::internal-padding=3
bg[NORMAL]=@toolbar
bg[PRELIGHT]=@toolbar
bg[SELECTED]=@toolbar
bg[ACTIVE]=@toolbar
bg[INSENSITIVE]=@toolbar
fg[NORMAL]=@windowtext
fg[PRELIGHT]=@windowtext
fg[SELECTED]=@windowtext
fg[ACTIVE]=@windowtext
fg[INSENSITIVE]=@inactivewindowtext
engine"pixmap"{
image{
function=SHADOW
shadow=NONE
file="../images/toolbar_horizontal.svg"
stretch=TRUE
border={0,0,1,1}
orientation=HORIZONTAL}
image{
function=SHADOW
shadow=NONE
file="../images/toolbar_vertical.svg"
stretch=TRUE
border={1,1,0,0}
orientation=VERTICAL}
##need to place this here or qgtkstlye will fail
image{
function=HANDLE
orientation=VERTICAL
file="../images/toolbar_vertical.svg"
overlay_file="../images/handle_horizontal.svg"
overlay_stretch=FALSE}
image{
function=HANDLE
orientation=HORIZONTAL
file="../images/toolbar_horizontal.svg"
overlay_file="../images/handle_vertical.svg"
overlay_stretch=FALSE
}}}
class"GtkToolbar"style"gtktoolbar"

#fixes the toolbar in buggy apps eg toolbar on dumb places (file chooser) or with spaces around (bulk rename)
style"toolbarnogradient"{
bg[NORMAL]=@window
bg[PRELIGHT]=@window
bg[SELECTED]=@window
bg[ACTIVE]=@window
bg[INSENSITIVE]=@window
engine"pixmap"{
image{
function=SHADOW
file="../images/trans.svg"
stretch=FALSE}}}
widget_class"*ThunarRename*GtkToolbar"style"toolbarnogradient"
widget_class"*GtkFileChooserDialog*GtkToolbar"style"toolbarnogradient"
widget_class"*GtkFileSelection*GtkToolbar"style"toolbarnogradient"

style"toolbarnogradient2"{
bg[NORMAL]=@basebg
bg[PRELIGHT]=@basebg
bg[SELECTED]=@basebg
bg[ACTIVE]=@basebg
bg[INSENSITIVE]=@basebg
engine"pixmap"{
image{
function=SHADOW
file="../images/trans.svg"
stretch=FALSE}}}
widget_class"*XfburnDataComposition*"style"toolbarnogradient2"
widget_class"*XfburnAudioComposition*"style"toolbarnogradient2"

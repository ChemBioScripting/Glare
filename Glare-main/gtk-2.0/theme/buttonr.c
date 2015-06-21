style"gtkbutton"{
xthickness=1
ythickness=1
GtkButton::default-outside-border={0,0,0,0}
GtkButton::default-border={0,0,0,0}
GtkButton::inner-border={2,2,2,2}
GtkButton::shadow-type=GTK_SHADOW_NONE
GtkWidget::wide-separators=1
GtkWidget::separator-height=0
GtkWidget::separator-width=0
GtkWidget::focus-line-width=0
GtkWidget::focus-padding=0
GtkWidget::interior-focus=0
engine"pixmap"{
image{
function=BOX
state=INSENSITIVE
shadow=OUT
file="../theme/images/button_disabled.svg"
border={2,2,2,2}
stretch=TRUE}
image{
function=BOX
state=NORMAL
file="../theme/images/button_normal.svg"
border={2,2,2,2}
stretch=TRUE}
image{
function=BOX
state=PRELIGHT
shadow=OUT
file="../theme/images/button_hover.svg"
border={2,2,2,2}
stretch=TRUE}
image{
function=BOX
state=PRELIGHT
shadow=IN
file="../theme/images/button_pressed.svg"
border={2,2,2,2}
stretch=TRUE}
image{
function=BOX
state=INSENSITIVE
shadow=IN
file="../theme/images/button_pressed.svg"
border={2,2,2,2}
stretch=TRUE}
image{
function=BOX
state=SELECTED
file="../theme/images/button_pressed.svg"
border={2,2,2,2}
stretch=TRUE}
image{
function=BOX
state=ACTIVE
file="../theme/images/button_pressed.svg"
border={2,2,2,2}
stretch=TRUE}
image{
detail="buttondefault"
file="../theme/images/trans.svg"
stretch=FALSE}
image{
detail="focus"
file="../theme/images/trans.svg"
stretch=FALSE}}}
class"GtkButton"style"gtkbutton"

style"gtklnkbutton"{
xthickness=0
ythickness=0
engine"pixmap"{
image{
function=BOX
file="../theme/images/trans.svg"
stretch=FALSE}}}
widget"*GtkLinkButton*"style"gtklnkbutton"

style"toolbarbutton"{
bg[NORMAL]=@basebg
bg[PRELIGHT]=@basebg
bg[SELECTED]=@basebg
bg[ACTIVE]=@basebg
bg[INSENSITIVE]=@basebg
engine"pixmap"{
image{
function=BOX
state=PRELIGHT
shadow=OUT
file="../theme/images/trans.svg"
stretch=FALSE}}}
widget_class"*GtkToolbar*GtkButton"style"toolbarbutton"
widget_class"*GtkToolbar*GtkToggleButton"style"toolbarbutton"
style"gtkviews"
{
xthickness=0
ythickness=0
GtkButton::inner-border={4,4,2,2}
fg[NORMAL]=@inactivewindowtext
fg[PRELIGHT]=@inactivewindowtext
fg[SELECTED]=@inactivewindowtext
fg[ACTIVE]=@inactivewindowtext
fg[INSENSITIVE]=@inactivewindowtext
engine"pixmap"
{
image
{
function=BOX
shadow=OUT
file="../themedark/images/treeview_header.svg"
border={0,1,0,1}
stretch=TRUE
}
image
{
function=BOX
shadow=IN
file="../themedark/images/treeview_header.svg"
border={0,1,0,1}
stretch=TRUE
}
}
}
widget_class"*.<GtkTreeView>.<GtkButton>*"style"gtkviews"
widget_class"*.<GtkCTree>.<GtkButton>"style"gtkviews"
widget_class"*.<GtkList>.<GtkButton>"style"gtkviews"
widget_class"*.<GtkCList>.<GtkButton>"style"gtkviews"

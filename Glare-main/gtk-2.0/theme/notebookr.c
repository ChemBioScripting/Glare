style"gtknotebook"{
xthickness=1
ythickness=1
GtkNotebook::tab-curvature=5
GtkNotebook::tab-overlap=2
bg[NORMAL]=@basebg
bg[PRELIGHT]=@basebg
bg[SELECTED]=@basebg
bg[ACTIVE]=@basebg
bg[INSENSITIVE]=@basebg
engine"pixmap"{
image{
function=BOX_GAP
file="../theme/images/notebook-top_bg.svg"
detail="notebook"
border={1,1,0,1}
stretch=TRUE
gap_file="../theme/images/notebook-horizontal_gap.svg"
gap_border={1,1,0,0}
gap_start_file="../theme/images/color-dbdbdb.svg"
gap_start_border={0,0,0,0}
gap_end_file="../theme/images/color-dbdbdb.svg"
gap_end_border={0,0,0,0}
gap_side=TOP}
image{
function=EXTENSION
state=ACTIVE
file="../theme/images/notebook-top_tab.svg"
border={1,1,1,1}
stretch=TRUE
gap_side=BOTTOM}
image{
function=EXTENSION
file="../theme/images/notebook-top_tab-selected.svg"
border={1,1,3,0}
stretch=TRUE
gap_side=BOTTOM}
image{
function=BOX_GAP
file="../theme/images/notebook-bottom_bg.svg"
detail="notebook"
border={1,1,1,0}
stretch=TRUE
gap_file="../theme/images/notebook-horizontal_gap.svg"
gap_border={1,1,0,0}
gap_start_file="../theme/images/color-dbdbdb.svg"
gap_start_border={0,0,0,0}
gap_end_file="../theme/images/color-dbdbdb.svg"
gap_end_border={0,0,0,0}
gap_side=BOTTOM}
image{
function=EXTENSION
state=ACTIVE
file="../theme/images/notebook-bottom_tab.svg"
border={1,1,1,1}
stretch=TRUE
gap_side=TOP}
image{
function=EXTENSION
file="../theme/images/notebook-bottom_tab-selected.svg"
border={1,1,0,3}
stretch=TRUE
gap_side=TOP}
image{
function=BOX_GAP
file="../theme/images/notebook-left_bg.svg"
detail="notebook"
border={0,1,1,1}
stretch=TRUE
gap_file="../theme/images/notebook-vertical_gap.svg"
gap_border={0,0,1,1}
gap_start_file="../theme/images/color-dbdbdb.svg"
gap_start_border={0,0,0,0}
gap_end_file="../theme/images/color-dbdbdb.svg"
gap_end_border={0,0,0,0}
gap_side=LEFT}
image{
function=EXTENSION
state=ACTIVE
file="../theme/images/notebook-left_tab.svg"
border={1,1,1,1}
stretch=TRUE
gap_side=RIGHT}
image{
function=EXTENSION
file="../theme/images/notebook-left_tab-selected.svg"
border={3,0,1,1}
stretch=TRUE
gap_side=RIGHT}
image{
function=BOX_GAP
file="../theme/images/notebook-right_bg.svg"
detail="notebook"
border={1,0,1,1}
stretch=TRUE
gap_file="../theme/images/notebook-vertical_gap.svg"
gap_border={0,0,1,1}
gap_start_file="../theme/images/color-dbdbdb.svg"
gap_start_border={0,0,0,0}
gap_end_file="../theme/images/color-dbdbdb.svg"
gap_end_border={0,0,0,0}
gap_side=RIGHT}
image{
function=EXTENSION
state=ACTIVE
file="../theme/images/notebook-right_tab.svg"
border={1,1,1,1}
stretch=TRUE
gap_side=LEFT}
image{
function=EXTENSION
file="../theme/images/notebook-right_tab-selected.svg"
border={0,3,1,1}
stretch=TRUE
gap_side=LEFT}
image{
function=ARROW
state=INSENSITIVE

file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-up_insensitive.svg"
overlay_stretch=FALSE
arrow_direction=UP}
image{
function=ARROW
state=INSENSITIVE

file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-down_insensitive.svg"
overlay_stretch=FALSE
arrow_direction=DOWN}
image{
function=ARROW
state=INSENSITIVE
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-left_insensitive.svg"
overlay_stretch=FALSE
arrow_direction=LEFT}
image{
function=ARROW
state=INSENSITIVE
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-right_insensitive.svg"
overlay_stretch=FALSE
arrow_direction=RIGHT}
image{
function=ARROW
state=NORMAL
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-up_normal.svg"
overlay_stretch=FALSE
arrow_direction=UP}
image{
function=ARROW
state=NORMAL
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-down_normal.svg"
overlay_stretch=FALSE
arrow_direction=DOWN}
image{
function=ARROW
state=NORMAL
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-left_normal.svg"
overlay_stretch=FALSE
arrow_direction=LEFT}
image{
function=ARROW
state=NORMAL
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-right_normal.svg"
overlay_stretch=FALSE
arrow_direction=RIGHT}
image{
function=ARROW
state=ACTIVE
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-up_hover.svg"
overlay_stretch=FALSE
arrow_direction=UP}
image{
function=ARROW
state=ACTIVE
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-down_hover.svg"
overlay_stretch=FALSE
arrow_direction=DOWN}
image{
function=ARROW
state=ACTIVE
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-left_hover.svg"
overlay_stretch=FALSE
arrow_direction=LEFT}
image{
function=ARROW
state=ACTIVE
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-right_hover.svg"
overlay_stretch=FALSE
arrow_direction=RIGHT}
image{
function=ARROW
state=PRELIGHT
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-up_hover.svg"
overlay_stretch=FALSE
arrow_direction=UP}
image{
function=ARROW
state=PRELIGHT
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-down_hover.svg"
overlay_stretch=FALSE
arrow_direction=DOWN}
image{
function=ARROW
state=PRELIGHT
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-left_hover.svg"
overlay_stretch=FALSE
arrow_direction=LEFT}
image{
function=ARROW
state=PRELIGHT
file="../theme/images/arrow-bg.svg"
stretch=FALSE
overlay_file="../theme/images/arrow-right_hover.svg"
overlay_stretch=FALSE
arrow_direction=RIGHT}}}
class"GtkNotebook"style"gtknotebook"

style"gtknotebookbgwhite"{
bg[NORMAL]=@basebg
bg[PRELIGHT]=@basebg
bg[SELECTED]=@basebg
bg[ACTIVE]=@basebg
bg[INSENSITIVE]=@basebg}
widget"*GtkNotebook*GtkScrolledWindow"style"gtknotebookbgwhite"
widget"*GtkNotebook*GtkScrolledWindow*GtkViewport"style"gtknotebookbgwhite" ##xfcesettings subdialogs
widget"*GtkNotebook*GtkCheckButton"style"gtknotebookbgwhite"
widget"*GtkNotebook*GtkRadioButton"style"gtknotebookbgwhite"

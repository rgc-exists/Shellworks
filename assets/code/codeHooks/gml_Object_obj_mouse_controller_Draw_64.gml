#orig#()

//Code from https://forum.gamemaker.io/index.php?threads/convert-gui-coordinates-to-real-position-in-the-level.97115/
var gui_x = global.cursor_on_gui_x;
var gui_y = global.cursor_on_gui_y;
var camera = view_camera[0]
var cw = camera_get_view_width(camera) / 1920
var ch = camera_get_view_height(camera) / 1080
global.input_virtualmouse_notgui_x = camera_get_view_x(camera) + gui_x * cw
global.input_virtualmouse_notgui_y = camera_get_view_y(camera) + gui_y * ch
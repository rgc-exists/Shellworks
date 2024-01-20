var x1 = argument0 
var y1 = argument1 
var x2 = argument2 
var y2 = argument3 
var color = argument4
var globalVar = argument5
var text = argument6
var text_color = argument7

draw_set_alpha(1)
curExistingColor = variable_global_get(globalVar)
draw_set_color(color)
draw_rectangle(x1, y1, x2, y2, false)
if (curExistingColor == -1){
    draw_set_color(c_white)
} else {
    draw_set_color(c_black)
}
draw_rectangle(x1, y1, x2, y2, true)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(text_color)
scr_draw_text_in_box(text, x2 - x1, y2 - y1, 1, -1, x1 + (x2 - x1) / 2, y1 + (y2 - y1) / 2, false)


if(mouse_check_button_pressed(mb_left)){
    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x1, y1, x2, y2)){
        return true
    }
}
return false

event_inherited()
if(variable_global_get(global_variable_name) != -1){
    col_alpha = 1
    r = color_get_red(variable_global_get(global_variable_name))
    g = color_get_green(variable_global_get(global_variable_name))
    b = color_get_blue(variable_global_get(global_variable_name))
} else {
    col_alpha = 0
    r = 0
    g = 0
    b = 0
}
draw_set_color(make_color_rgb(r, g, b))
if(col_alpha > 0){
    draw_rectangle((room_width - 370), (room_height / 2),(room_width - 370) + 40, (room_height / 2) + 40, false)
    draw_set_color(c_white)
    draw_rectangle((room_width - 370), (room_height / 2),(room_width - 370) + 40, (room_height / 2) + 40, true)
    draw_rectangle((room_width - 370) + 1, (room_height / 2) + 1,(room_width - 370) + 40 - 1, (room_height / 2) + 40 - 1, true)
    draw_rectangle((room_width - 370) - 1, (room_height / 2) - 1,(room_width - 370) + 40 + 1, (room_height / 2) + 40 + 1, true)
}
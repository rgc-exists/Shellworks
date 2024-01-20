global_var_name = global_variable_name
color = argument0
if(color != -1 && !is_undefined(color)){
    variable_global_set(global_var_name, merge_color(color, c_black, dark_blend))
    r = color_get_red(variable_global_get(global_var_name))
    g = color_get_green(variable_global_get(global_var_name))
    b = color_get_blue(variable_global_get(global_var_name))
} else {
    variable_global_set(global_var_name, -1)
    r = -1
    b = -1
    g = -1
}
obj_persistent.should_restart_after_exit_menu = true
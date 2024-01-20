global_var_name = argument0
r_g_b = argument1
if(!is_undefined(argument2)){
    value = argument2
} else {
    value = -1
}
if(parent_menu.parent_menu.r == -1){
    parent_menu.parent_menu.r = 0
}
if(parent_menu.parent_menu.g == -1){
    parent_menu.parent_menu.g = 0
}
if(parent_menu.parent_menu.b == -1){
    parent_menu.parent_menu.b = 0
}
og_r = parent_menu.parent_menu.r
og_g = parent_menu.parent_menu.g
og_b = parent_menu.parent_menu.b
switch r_g_b {
    case 0:
        variable_global_set(global_var_name, make_color_rgb(clamp(og_r + value, 0, 255), clamp(og_g, 0, 255), clamp(og_b, 0, 255)))
        break;
    case 1:
        variable_global_set(global_var_name, make_color_rgb(clamp(og_r, 0, 255), clamp(og_g + value, 0, 255), clamp(og_b, 0, 255)))
        break;
    case 2:
        variable_global_set(global_var_name, make_color_rgb(clamp(og_r, 0, 255), clamp(og_g, 0, 255), clamp(og_b + value, 0, 255)))
        break;
}
parent_menu.parent_menu.r = color_get_red(variable_global_get(global_var_name))
parent_menu.parent_menu.g = color_get_green(variable_global_get(global_var_name))
parent_menu.parent_menu.b = color_get_blue(variable_global_get(global_var_name))
obj_persistent.should_restart_after_exit_menu = true
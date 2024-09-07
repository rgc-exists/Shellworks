var label = argument0
var global_var_name = argument1 
var save_settings = argument2
if(save_settings == undefined)
    save_settings = true



var global_var_value = variable_global_get(global_var_name)

var new_value = imgui_color_edit(label, global_var_value)

if(global.shellworks_imgui_time_menu_open > 5){
    variable_global_set(global_var_name, new_value)
    if(global_var_value != new_value){
        if(save_settings){
            scr_save_settings()
        }
    }
}

return new_value 
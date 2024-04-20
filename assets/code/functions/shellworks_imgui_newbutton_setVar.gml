var label = argument0
var global_var_name = argument1
var value_to_set = argument2
var save_settings = argument3
if(save_settings == undefined)
    save_settings = true

var global_var_value = variable_global_get(global_var_name)

var button_pressed = imgui_button(label)

if(button_pressed){
    if(global.shellworks_imgui_time_menu_open > 5){
        variable_global_set(global_var_name, value_to_set)
        if(save_settings){
            scr_save_settings()
        }
    }
}


return button_pressed 
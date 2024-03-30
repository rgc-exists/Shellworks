var label = argument0
var global_var_name = argument1
var save_settings = argument2
if(save_settings == undefined)
    save_settings = true

var global_var_value = variable_global_get(global_var_name)

var button_pressed = imgui_button(label)

if(button_pressed){
    if(global.shellworks_imgui_time_menu_open > 60){
        variable_global_set(global_var_name, !global_var_value)
        if(save_settings){
            scr_save_settings()
        }
    }
}


return button_pressed 
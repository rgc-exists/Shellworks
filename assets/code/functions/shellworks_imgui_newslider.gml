var label = argument0
var global_var_name = argument1 
var minimum = argument2
var maximum = argument3
var wait_until_deselect = argument4
if(wait_until_deselect == undefined){
    wait_until_deselect = false
}
var save_settings = argument5
if(save_settings == undefined)
    save_settings = true
var step = argument6 

if(step == undefined) step = 0.01

var global_var_value = variable_global_get(global_var_name)

var new_value = imgui_slider(label, minimum, maximum, global_var_value)

if(imgui_deselected_after_edit() || !wait_until_deselect){
    if(global.shellworks_imgui_time_menu_open > 5){
        variable_global_set(global_var_name, round(new_value / step) * step)
        
        if(global_var_value != new_value){
            if(save_settings){
                scr_save_settings()
            }
        }
    }
}

return new_value 
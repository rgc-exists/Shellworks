var label = argument0
var global_var_name = argument1 
var format = argument2 
var doClamp = argument3
var clampMin = argument4
var clampMax = argument5
var save_settings = argument6
if(save_settings == undefined)
    save_settings = true


if(doClamp == undefined || clampMin == undefined || clampMax == undefined)
    doClamp = false

if(format == undefined)
    format = "%.2f"


var global_var_value = variable_global_get(global_var_name)

var new_value = imgui_input_real(label, global_var_value, format)

if(imgui_deselected_after_edit()){
    if(global.shellworks_imgui_time_menu_open > 5){
        variable_global_set(global_var_name, new_value)
        if(doClamp){
            var clamped_value = clamp(variable_global_get(global_var_name), clampMin, clampMax)
            variable_global_set(global_var_name, new_value)
        }
        if(save_settings){
            scr_save_settings()
        }
    }
}

return new_value 
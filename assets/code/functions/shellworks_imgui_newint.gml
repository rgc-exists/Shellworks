var label = argument0
var global_var_name = argument1
var doClamp = argument2
var clampMin = argument3
var clampMax = argument4
var save_settings = argument5
if(save_settings == undefined)
    save_settings = true


format = "%.0f"


var global_var_value = variable_global_get(global_var_name)

var new_value = imgui_input_real(label, global_var_value, format)

if(imgui_deselected_after_edit()){
    if(global.shellworks_imgui_time_menu_open > 60){
        variable_global_set(global_var_name, new_value)
        if(doClamp){
            var clamped_value = clamp(variable_global_get(global_var_name), clampMin, clampMax)
            variable_global_set(global_var_name, new_value)
        }
        if(global_var_value != new_value){
            if(save_settings){
                scr_save_settings()
            }
        }
    }
}

return new_value 

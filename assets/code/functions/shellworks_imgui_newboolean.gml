var label = argument0
var global_var_name = argument1
var apply_button = argument2 
if(apply_button == undefined)
    apply_button = false
var save_settings = argument3 
if(save_settings == undefined)
    save_settings = true

var global_var_value = variable_global_get(global_var_name)

var new_value = imgui_checkbox(label, global_var_value)

var button_val = false
if(apply_button){
    imgui_same_line()
    var button_val = imgui_button("APPLY")
}

if(!apply_button || button_val){
    if(global.shellworks_imgui_time_menu_open > 60){
        variable_global_set(global_var_name, new_value)
        if(global_var_value != new_value){
            if(save_settings){
                scr_save_settings()
            }
        }
    }
}

return new_value 
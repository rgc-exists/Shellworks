var label = argument0
var func_to_do = argument1
var args = argument2
if(args == undefined)
    args = []
var save_settings = argument3 
if(save_settings == undefined)
    save_settings = true

var new_value = imgui_button(label)
if(new_value){
    if(global.shellworks_imgui_time_menu_open > 60){
        script_execute_ext(func_to_do, args, 0)
        if(save_settings){
            scr_save_settings()
        }
    }
}


return new_value 
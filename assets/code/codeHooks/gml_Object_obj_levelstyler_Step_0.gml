
needs_reload = global.levelstyler_colors_need_to_be_reloaded

if(needs_reload){
    if(!file_exists("Colors/" + string(global.setting_color_scheme) + "/" + "Normal.txt")){
        show_debug_message("The selected color scheme was deleted! Reverting to color scheme #2...")
        global.setting_color_scheme = 2
    }
}

#orig#()

just_started_level = false

if(global.just_applied_colors){
    global.just_applied_colors = false 
    return false;
}


if(needs_reload){
    gml_Script_scr_load_to_selected_colors()
}
needs_reload = false

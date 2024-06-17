var needs_reload = global.levelstyler_colors_need_to_be_reloaded

#orig#()

if(global.just_applied_colors){
    gml_Script_scr_apply_selected_colors(false)
    global.just_applied_colors = false
    return false;
}

if(needs_reload){
    gml_Script_scr_load_colors_to_apply()
}


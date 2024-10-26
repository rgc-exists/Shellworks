
needs_reload = global.levelstyler_colors_need_to_be_reloaded

if(needs_reload){
    if(!file_exists("Colors/" + string(global.setting_color_scheme) + "/" + "Normal.txt")){
        gml_Script_shellworks_imgui_createpopup_message("Color scheme deleted!", "The selected color scheme was deleted!\nReverting to color scheme #2...", "Okay.")
        global.setting_color_scheme = 2
    }
}

#orig#()

just_started_level = false

if(global.just_copied_color_scheme > 0){
    if(global.just_copied_color_scheme == 2){
        global.levelstyler_colors_need_to_be_reloaded = true
        if(room == level_editor_play_mode){
            global.levelstyler_colors_need_to_be_reloaded = true
            //with(obj_levelstyler) color_scheme_backup = -1
            leveleditor_play_current_level(false)
        } else if(room != level_editor /* && room != level_editor_play_mode */ && room != menu && room != main_menu_dark){
            //with(obj_levelstyler) color_scheme_backup = -1
            room_restart()
        }
    }

    global.just_copied_color_scheme -= 1 

} else if(global.just_changed_schemes){
    gml_Script_scr_load_to_selected_colors()
    global.just_changed_schemes = false
} else if(global.just_applied_colors){
    global.just_applied_colors = false 
    if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler){
        theme_type = "Normal"
        theme_path = "Normal.txt"
    } else if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler_brain){
        theme_type = "Brain"
        theme_path = "Brain.txt"
    } else if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler_disco){
        theme_type = "Disco"
        theme_path = "Disco.txt"
    } else if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler_underwater){
        theme_type = "Underwater"
        theme_path = "Underwater.txt"
    } else if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler_winter){
        theme_type = "Winter"
        theme_path = "Winter.txt"
    } else if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler_bubblegum){
        theme_type = "Bubblegum"
        theme_path = "Bubblegum.txt"
    }
    if(global.prev_theme_type == theme_type){
        gml_Script_scr_apply_selected_colors(false)
        gml_Script_scr_update_hueshift()
        return false;
    }
}


if(needs_reload){
    gml_Script_scr_update_backdraw()
    gml_Script_scr_load_to_selected_colors()
}
needs_reload = false

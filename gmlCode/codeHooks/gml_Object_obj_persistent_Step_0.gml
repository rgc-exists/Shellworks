
#orig#()


global.frames_since_startup += 1

if(go_to_a_room_next){
    go_to_a_room_next = false
    room_goto(room_to_goto_next)
}
if(room != level_editor && room != level_editor_play_mode && room != menu && room != main_menu_dark){
    if(variable_instance_exists(id, "swapPump_remember")){
        if(swapPump_remember != global.save_pump_is_inverted){
            room_restart()
        }
    }
    if(variable_instance_exists(id, "heartFixed_remember")){
        if(heartFixed_remember != global.save_heart_fixed && room != InBrain_02 && room != InBrain_Controlroom){
            room_restart()
        }
    }
    if(should_restart_after_exit_menu){
        should_restart_after_exit_menu = 0
        room_restart()
    }
    swapPump_remember = global.save_pump_is_inverted
    heartFixed_remember = global.save_heart_fixed
}
if(keyboard_check(ord("Y")) && keyboard_check(ord("O"))){
    aivl_play_ext("squid_yo", -1, -1, 3, 0, 1)
}

if(room != level_editor && room != menu){
    global.inspector_active = false
}




if(instance_exists(obj_player)){
    global.player_has_existed = true

    if(obj_player.dead >= 0){
        global.player_is_dead = true
    } else {
        global.player_is_dead = false
    }
} else {
    global.player_is_dead = false
}

if(global.room_remember != room && room != menu){
    global.room_remember = room
    global.player_exists_remember = false
    global.total_half_jumps_so_far_can_change = true

}

if(global.frames_since_startup == 2){
    toggle_console(global.setting_show_console)
    
    global.shellworks_cache_directory = "Shellworks_Cache\\"
    show_debug_message("Cache directory: " + global.shellworks_cache_directory)
    if(!directory_exists(global.shellworks_cache_directory)){
        show_debug_message(global.shellworks_cache_directory + " doesn't exist.")
        directory_create(global.shellworks_cache_directory)
    }
    global.dont_do_updates_cache_path = global.shellworks_cache_directory + "DoUpdates.txt"
    if(file_exists(global.dont_do_updates_cache_path)){
        var f = file_text_open_read(global.dont_do_updates_cache_path)
        global.shw_setting_do_updates = file_text_read_real(f)
        file_text_close(f)
    } else {
        global.shw_setting_do_updates = true
    }

    gml_Script_scr_revert_selected_player_colors()
} else if(global.frames_since_startup > 2){
    if(instance_exists(obj_levelstyler)){
        if(!global.setting_player_body_selected_enabled)
            global.setting_player_body_selected = obj_levelstyler.col_snail_body
        if(!global.setting_player_shell_selected_enabled)
            global.setting_player_shell_selected = obj_levelstyler.col_snail_shell
        if(!global.setting_player_outline_selected_enabled)
            global.setting_player_outline_selected = obj_levelstyler.col_snail_outline
        if(!global.setting_player_eye_selected_enabled)
            global.setting_player_eye_selected = obj_levelstyler.col_snail_eye
        if(!global.setting_player_death_selected_enabled)
            global.setting_player_death_selected = obj_levelstyler.col_snail_death
        if(!global.setting_player_spotlight_selected_enabled)
            global.setting_player_spotlight_selected = obj_levelstyler.col_player_spotlight
        if(!global.setting_player_spotlight_dark_selected_enabled)
            global.setting_player_spotlight_dark_selected = obj_levelstyler.col_player_spotlight_dark
        if(!global.setting_player_flare_selected_enabled)
            global.setting_player_flare_selected = obj_levelstyler.col_snail_flare
        if(!global.setting_player_trail_selected_enabled)
            global.setting_player_trail_selected = obj_levelstyler.col_player_trail
    }
}


if(global.setting_mute_when_unfocused && !window_has_focus()){
    audio_master_gain(0)
} else {
    audio_master_gain(global.setting_volume_master * global.setting_volume_master)
}

if(room == level_editor_play_mode){
    if(global.setting_spawnpoint_switcher){
        if(keyboard_lastchar == "." || keyboard_lastchar == ">"){
            if(!holding_spawnSwitchButton){
                keyboard_lastchar = ""
                holding_spawnSwitchButton = true
                spawn_switched_timer = 120
                show_debug_message("Moving forward to next spawnpoint")

                global.current_spawnpoint += 1
                if(global.current_spawnpoint >= array_length(global.current_spawnpoints_list)) global.current_spawnpoint = 0

                gml_Script_scr_spawnpoint_switcher_switch(global.current_spawnpoint)
            }
        } else if(keyboard_lastchar == "," || keyboard_lastchar == "<"){
            if(!holding_spawnSwitchButton){
                keyboard_lastchar = ""
                holding_spawnSwitchButton = true
                spawn_switched_timer = 120
                show_debug_message("Moving backward to previous spawnpoint")

                global.current_spawnpoint -= 1
                if(global.current_spawnpoint < 0) global.current_spawnpoint = array_length(global.current_spawnpoints_list) - 1

                gml_Script_scr_spawnpoint_switcher_switch(global.current_spawnpoint)
            }
        } else {
            holding_spawnSwitchButton = false
        }
    }
}

spawn_switched_timer -= 1
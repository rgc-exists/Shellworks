if(file_exists("SettoIngs23-2.set")){
    gml_Script_scr_get_game_version_from_orig_settings_function()
}

if(variable_global_exists("is_resetting_settings")){
    if(global.is_resetting_settings == 1){
        global.is_resetting_settings = 0
        return false;
    }
}
#orig#()
if(variable_global_exists("is_resetting_settings")){
    if(global.is_resetting_settings == 2){
        global.is_resetting_settings = 0
        return false;
    }
}

file = file_text_open_write("Shellworks_SettoIngs23-2.set")
file_text_write_string(file, "Hello, human. Welcome to the advanced version of the Shellworks exclusive settings.")
file_text_writeln(file)
file_text_write_string(file, "Make sure you know what you're doing before you change anything here.")
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "!! Edit at your own risk !!")
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Mod Version")
file_text_writeln(file)
file_text_write_string(file, global.shellworks_version)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Squid In Editor")
file_text_writeln(file)
file_text_write_real(file, global.setting_squid_in_editor)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Epilepsy Warning")
file_text_writeln(file)
file_text_write_real(file, global.setting_epilepsy_warning)
repeat (2)
    file_text_writeln(file)
/*
file_text_write_string(file, "Multi-Frame Loading")
file_text_writeln(file)
file_text_write_real(file, global.setting_multiframe_loading)
repeat (2)
    file_text_writeln(file)
*/
file_text_write_string(file, "Camera Zoom Min")
file_text_writeln(file)
file_text_write_real(file, global.setting_camzoom_min)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Camera Zoom Max")
file_text_writeln(file)
file_text_write_real(file, global.setting_camzoom_max)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Intense Backgrounds")
file_text_writeln(file)
file_text_write_real(file, global.setting_intense_backgrounds)
repeat (2)
    file_text_writeln(file)
/*
file_text_write_string(file, "Squid Consistent Opacity")
file_text_writeln(file)
file_text_write_real(file, global.setting_squid_constant_opacity)
repeat (2)
    file_text_writeln(file)
*/
file_text_write_string(file, "Skip Title Animation")
file_text_writeln(file)
file_text_write_real(file, global.setting_skip_title_animation)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Open Hotkeys Message")
file_text_writeln(file)
file_text_write_real(file, global.setting_show_hotkeys_overlay)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Place Multiple Players")
file_text_writeln(file)
file_text_write_real(file, global.setting_place_multiple_players)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Player Body Color")
file_text_writeln(file)
file_text_write_real(file, global.setting_player_body)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Player Shell Color")
file_text_writeln(file)
file_text_write_real(file, global.setting_player_shell)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Player Outline Color")
file_text_writeln(file)
file_text_write_real(file, global.setting_player_outline)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Player Eye Color")
file_text_writeln(file)
file_text_write_real(file, global.setting_player_eye)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Player Death Color")
file_text_writeln(file)
file_text_write_real(file, global.setting_player_death)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Player Spotlight Color")
file_text_writeln(file)
file_text_write_real(file, global.setting_player_spotlight)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Player Spotlight Dark Color")
file_text_writeln(file)
file_text_write_real(file, global.setting_player_spotlight_dark)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Player Flare Color")
file_text_writeln(file)
file_text_write_real(file, global.setting_player_flare)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Player Trail Color")
file_text_writeln(file)
file_text_write_real(file, global.setting_player_trail)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Default Hat")
file_text_writeln(file)
file_text_write_real(file, global.setting_default_hat)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Unicorn Horn Ball Override")
file_text_writeln(file)
file_text_write_real(file, global.setting_unicorn_horn_ball_override)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Campaign Exploration Mode")
file_text_writeln(file)
file_text_write_real(file, global.setting_campaign_exploration_mode)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Place Multiple 1-At-A-Time Objects")
file_text_writeln(file)
file_text_write_real(file, global.setting_place_multiple_oneAtATime_objs)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Restart Invincibility")
file_text_writeln(file)
file_text_write_real(file, global.restart_invincible_mode)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Global Inspector")
file_text_writeln(file)
file_text_write_real(file, global.setting_global_inspector_available)
repeat (2)
    file_text_writeln(file)
    /*
file_text_write_string(file, "Player Respawn Time")
file_text_writeln(file)
file_text_write_real(file, global.setting_respawn_time)
repeat (2)
    file_text_writeln(file)
    */
file_text_write_string(file, "Input Display")
file_text_writeln(file)
file_text_write_real(file, global.setting_input_display)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Legitimacy Marker")
file_text_writeln(file)
file_text_write_real(file, global.setting_legitimacy_marker)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Noclip Death Indicator")
file_text_writeln(file)
file_text_write_real(file, global.setting_noclip_indicator)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Copy Tool Bypass")
file_text_writeln(file)
file_text_write_real(file, global.setting_copy_tool_bypass)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Noclip Indicator Color")
file_text_writeln(file)
file_text_write_real(file, global.setting_noclip_indicator_color)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Noclip Indicator Transparency")
file_text_writeln(file)
file_text_write_real(file, global.setting_noclip_indicator_transparency)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Speedrun Attempt Timer")
file_text_writeln(file)
file_text_write_real(file, global.setting_speedrun_timer_attempt)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Enter Value Manually")
file_text_writeln(file)
file_text_write_real(file, global.setting_enter_value_manually)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Show Console")
file_text_writeln(file)
file_text_write_real(file, global.setting_show_console)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Disable Editor Music")
file_text_writeln(file)
file_text_write_real(file, global.setting_disable_editor_music)
repeat (2)
    file_text_writeln(file)
file_text_write_string(file, "Mute When Unfocused")
file_text_writeln(file)
file_text_write_real(file, global.setting_mute_when_unfocused)
repeat (2)
    file_text_writeln(file)


file_text_close(file)
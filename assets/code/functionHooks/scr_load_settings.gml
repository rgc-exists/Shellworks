
if(file_exists("SettoIngs23-2.set"))
    #orig#()



gml_Script_scr_initialize_BSE_settings()
if(file_exists("Shellworks_SettoIngs23-2.set")){
    file = file_text_open_read("Shellworks_SettoIngs23-2.set")
    save_file_version = ""
    while (!file_text_eof(file))
    {
        section_header = file_text_read_string(file)
        file_text_readln(file)
        switch section_header
        {
            case "Mod Version":
                mod_save_file_version = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Squid In Editor":
                global.setting_squid_in_editor = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Epilepsy Warning":
                global.setting_epilepsy_warning = file_text_read_real(file)
                file_text_readln(file)
                break
            /*
            case "Multi-Frame Loading":
                global.setting_multiframe_loading = file_text_read_real(file)
                file_text_readln(file)
                break
            */
            case "Camera Zoom Min":
                global.setting_camzoom_min = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Camera Zoom Max":
                global.setting_camzoom_max = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Intense Backgrounds":
                global.setting_intense_backgrounds = file_text_read_real(file)
                file_text_readln(file)
                break
            /*
            case "Squid Consistent Opacity":
                global.setting_squid_constant_opacity = file_text_read_real(file)
                file_text_readln(file)
                break
            */
            case "Skip Title Animation":
                global.setting_skip_title_animation = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Open Hotkeys Message":
                global.setting_show_hotkeys_overlay = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Place Multiple Players":
                global.setting_place_multiple_players = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Body Color":
                global.setting_player_body = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Shell Color":
                global.setting_player_shell = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Outline Color":
                global.setting_player_outline = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Eye Color":
                global.setting_player_eye = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Death Color":
                global.setting_player_death = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Spotlight Color":
                global.setting_player_spotlight = file_text_read_real(file)
                if(save_file_version == "v1.2.0-BETA3") //I accidentally forgot to update the version for the initial beta release of Shellworks. This version name is left over from Better Snail Editor, which Shellworks is based on.
                    global.setting_player_spotlight = merge_color(global.setting_player_spotlight, c_white, 0.6)
                file_text_readln(file)
                break
            case "Player Spotlight Dark Color":
                global.setting_player_spotlight_dark = file_text_read_real(file)
                if(save_file_version == "v1.2.0-BETA3") //I accidentally forgot to update the version for the initial beta release of Shellworks. This version name is left over from Better Snail Editor, which Shellworks is based on.
                    global.setting_player_spotlight = merge_color(global.setting_player_spotlight_dark, c_white, 0.8)
                file_text_readln(file)
                break
            case "Player Flare Color":
                global.setting_player_flare = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Trail Color":
                global.setting_player_trail = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Default Hat":
                global.setting_default_hat = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Unicorn Horn Ball Override":
                global.setting_unicorn_horn_ball_override = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Place Multiple 1-At-A-Time Objects":
                global.setting_place_multiple_oneAtATime_objs = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Restart Invincibility":
                global.restart_invincible_mode = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Global Inspector":
                global.setting_global_inspector_available = file_text_read_real(file)
                file_text_readln(file)
                break
                /*
            case "Player Respawn Time":
                global.setting_respawn_time = file_text_read_real(file)
                file_text_readln(file)
                break
                */
            case "Input Display":
                global.setting_input_display = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Legitimacy Marker":
                global.setting_legitimacy_marker = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Noclip Death Indicator":
                global.setting_noclip_indicator = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Copy Tool Bypass":
                global.setting_copy_tool_bypass = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Noclip Indicator Color":
                global.setting_noclip_indicator_color = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Noclip Indicator Transparency":
                global.setting_noclip_indicator_transparency = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Speedrun Attempt Timer":
                global.setting_speedrun_timer_attempt = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Enter Value Manually":
                global.setting_enter_value_manually = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Show Console":
                global.setting_show_console = file_text_read_real(file)
                file_text_readln(file)
                break
        }
    }
    file_text_close(file)
}


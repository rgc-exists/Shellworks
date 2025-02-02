depth = -14000


with(global.inputaction_shellworks_openmenu){
    if(#cursed_inline_funcname_getpressedplus#()){
        global.shellworks_imgui_menuOpen = !global.shellworks_imgui_menuOpen
        global.shellworks_C10_secret = (irandom(100) == 1)

        if(global.shellworks_first_menu_press){
            var f = file_text_open_write("shellworks_hasBeenBootedUp.dontDelete")
            file_text_write_string(f, "1")
            file_text_close(f)
            global.shellworks_first_menu_press = false
        }
    }
}

if(room == menu){
    global.shellworks_imgui_menuOpen = false
}

imgui_newframe()


if(global.shellworks_imgui_menuOpen || instance_exists(obj_shellworksUI_popup)){

    global.shellworks_imgui_time_menu_open += 1

}

if(global.shellworks_imgui_menuOpen){
    if(!global.shellworks_imgui_colorSchemeEditor_open){
        imgui_begin("GAMEPLAY")
        
        imgui_separator_text("Special")
        gml_Script_shellworks_imgui_newboolean("Inverted Pump", "save_pump_is_inverted")
        gml_Script_shellworks_imgui_newboolean("Fixed Squid", "save_heart_fixed")
        gml_Script_shellworks_imgui_newboolean("Show AI Predictions", "setting_show_ai_predictions")
        gml_Script_shellworks_imgui_newboolean("Spawnpoint Switcher", "setting_spawnpoint_switcher")
        imgui_text("(Press , and . on your keyboard to switch spawnpoints.)")
        
        imgui_separator_text("Cheats")
        gml_Script_shellworks_imgui_newboolean("Noclip", "invincible_mode")
        gml_Script_shellworks_imgui_newboolean("Self Destruct Invincibility", "restart_invincible_mode")
        gml_Script_shellworks_imgui_newboolean("Fuse Invincibility", "fuse_invincible_mode")
        gml_Script_shellworks_imgui_newboolean("Ball Invincibility", "ball_invincible_mode")
        gml_Script_shellworks_imgui_newboolean("Tower Defense Invincibility", "td_invincible_mode")
        gml_Script_shellworks_imgui_newboolean("Infinite Double Jumps", "infinite_jumps")
        gml_Script_shellworks_imgui_newreal("Player Speed", "cheat_player_speed")
        gml_Script_shellworks_imgui_newreal("Jump Height", "cheat_jump_height")
        imgui_text("(Underwater Max Fall Speed has been temporarily removed due to a last-minute bug discovery.)")
        //gml_Script_shellworks_imgui_newreal("Max Fall Speed\n(Underwater Only)", "cheat_max_fall_speed")
        
        imgui_separator_text("Speedhack")
        var prevGameSpeed = global.save_game_speed
        gml_Script_shellworks_imgui_newreal("Game Speed", "save_game_speed", "%.2f", true, 0.01, 100)
        if(global.save_game_speed != prevGameSpeed){
            scr_change_gamespeed(0)
        }

        imgui_end()



        imgui_begin("EDITOR")

        imgui_separator_text("Bypass")
        gml_Script_shellworks_imgui_newboolean("Multiple 1-at-a-time Objects", "setting_place_multiple_oneAtATime_objs")
        gml_Script_shellworks_imgui_newboolean("Place Multiple Players", "setting_place_multiple_players")

        imgui_separator_text("Camera")
        gml_Script_shellworks_imgui_newreal("Minimum Zoom", "setting_camzoom_min")
        gml_Script_shellworks_imgui_newreal("Maximum Zoom", "setting_camzoom_max")

        imgui_separator_text("Shellworks")
        gml_Script_shellworks_imgui_newboolean("\"O for hotkeys\" message", "setting_show_hotkeys_overlay")
        gml_Script_shellworks_imgui_newslider("Grid Contrast", "setting_editorGrid_contrast", 1, 2)


        imgui_separator_text("Other")
        gml_Script_shellworks_imgui_newboolean("Disable Editor Music", "setting_disable_editor_music")
        //gml_Script_shellworks_imgui_newboolean("Persistent Clipboard", "setting_persistent_clipboard")
        //Disabled for now due to major crashes.
        if(room != level_editor){
            gml_Script_shellworks_imgui_newboolean("Manual Value Textbox", "setting_enter_value_manually")
            gml_Script_shellworks_imgui_newboolean("Squid In Editor", "setting_squid_in_editor")
        } else {
            imgui_text("Some settings are not available while using the editor.")
        }

        imgui_separator_text("Copy Tool")
        gml_Script_shellworks_imgui_newboolean("All Objects Copyable", "setting_copy_tool_bypass")
        gml_Script_shellworks_imgui_newboolean("Copyable Wires", "setting_copyable_wires")
        gml_Script_shellworks_imgui_newboolean("Preserve Copy Order", "setting_preserve_copy_order")
        imgui_text("(Fixes inconsistent layering when copying objects.)")

        
        imgui_separator_text("Advanced")
        gml_Script_shellworks_imgui_newboolean("Optimized Saving", "setting_optimized_saving")
        if(global.disable_save_related_settings){
            imgui_text("OPTIMIZED SAVING HAS BEEN DISABLED DUE TO POSSIBLE INCOMPATIBILITY.")
        }
        imgui_text("(DRASTICALLY speeds up saving large levels using buffers.)")


        imgui_end()




        imgui_begin("COSMETIC")

        imgui_separator_text("Accessibility")
        gml_Script_shellworks_imgui_newslider("Intense Backgrounds", "setting_intense_backgrounds", 0, 1)

        imgui_separator_text("Cutscenes")
        gml_Script_shellworks_imgui_newboolean("Epilepsy Warning", "setting_epilepsy_warning")
        gml_Script_shellworks_imgui_newboolean("Skip Title Animation", "setting_skip_title_animation")
        
        imgui_separator_text("Other")
        gml_Script_shellworks_imgui_newboolean("Legitimacy Marker", "setting_legitimacy_marker")
        gml_Script_shellworks_imgui_newboolean("Noclip Death Indicator", "setting_noclip_indicator")
        gml_Script_shellworks_imgui_newcolorpicker("Color Noclip Indicator", "setting_noclip_indicator_color")
        gml_Script_shellworks_imgui_newslider("Transparency Noclip Indicator", "setting_noclip_indicator_transparency", 0, 1)
        gml_Script_shellworks_imgui_newboolean("Input Display", "setting_input_display")

        imgui_separator_text("Squid Visuals")
        gml_Script_shellworks_imgui_newslider("Squid Opacity", "setting_squid_opacity", 0, 1)


        imgui_end()

        imgui_begin("PLAYER CHARACTER")
        imgui_separator_text("Colors")

        gml_Script_shellworks_imgui_newboolean("Body", "setting_player_body_selected_enabled")
        imgui_same_line()
        gml_Script_shellworks_imgui_newcolorpicker(" ", "setting_player_body_selected")

        gml_Script_shellworks_imgui_newboolean("Shell", "setting_player_shell_selected_enabled")
        imgui_same_line()
        gml_Script_shellworks_imgui_newcolorpicker("  ", "setting_player_shell_selected")

        gml_Script_shellworks_imgui_newboolean("Outline", "setting_player_outline_selected_enabled")
        imgui_same_line()
        gml_Script_shellworks_imgui_newcolorpicker("   ", "setting_player_outline_selected")

        gml_Script_shellworks_imgui_newboolean("Eyes", "setting_player_eye_selected_enabled")
        imgui_same_line()
        gml_Script_shellworks_imgui_newcolorpicker("    ", "setting_player_eye_selected")

        gml_Script_shellworks_imgui_newboolean("DeathFX", "setting_player_death_selected_enabled")
        imgui_same_line()
        gml_Script_shellworks_imgui_newcolorpicker("     ", "setting_player_death_selected")

        gml_Script_shellworks_imgui_newboolean("Spotlight (Bright)", "setting_player_spotlight_selected_enabled")
        imgui_same_line()
        gml_Script_shellworks_imgui_newcolorpicker("      ", "setting_player_spotlight_selected")
        
        gml_Script_shellworks_imgui_newboolean("Spotlight (Dark)", "setting_player_spotlight_dark_selected_enabled")
        imgui_same_line()
        gml_Script_shellworks_imgui_newcolorpicker("       ", "setting_player_spotlight_dark_selected")

        gml_Script_shellworks_imgui_newboolean("Flare", "setting_player_flare_selected_enabled")
        imgui_same_line()
        gml_Script_shellworks_imgui_newcolorpicker("        ", "setting_player_flare_selected")
        
        gml_Script_shellworks_imgui_newboolean("Trail", "setting_player_trail_selected_enabled")
        imgui_same_line()
        gml_Script_shellworks_imgui_newcolorpicker("         ", "setting_player_trail_selected")

        gml_Script_shellworks_imgui_newbutton_doFunc("Apply Colors", gml_Script_scr_apply_selected_player_colors)
        imgui_same_line()
        gml_Script_shellworks_imgui_newbutton_doFunc("Revert Changes", gml_Script_scr_revert_selected_player_colors)

        imgui_separator_text("Hats")
        gml_Script_shellworks_imgui_newbutton_doFunc("Hat Select", gml_Script_scr_go_to_room_custom, [RoomOfHats])
        gml_Script_shellworks_imgui_newbutton_doFunc("Set Default Hat to Current", gml_Script_scr_set_default_hat, [global.save_equipped_hat])

        imgui_separator_text("Saving/Loading")
        gml_Script_shellworks_imgui_newbutton_doFunc("Save Character", gml_Script_scr_save_character)
        imgui_same_line()
        gml_Script_shellworks_imgui_newbutton_doFunc("Load Character", gml_Script_scr_load_character)

        imgui_separator_text("Other")
        gml_Script_shellworks_imgui_newboolean("Unicorn Hat Pops Ball", "setting_unicorn_horn_ball_override")

        gml_Script_shellworks_imgui_newbutton_doFunc("Character Customization UI\n(DEPRECATED)", gml_Script_scr_go_to_character_select)
        
        imgui_end()


        imgui_begin("MISCELLANEOUS")

        imgui_separator_text("Rooms")
        gml_Script_shellworks_imgui_newbutton_doFunc("Level Select", gml_Script_scr_go_to_room_custom, [level_select])
        gml_Script_shellworks_imgui_newbutton_doFunc("Campaign Select", gml_Script_scr_go_to_room_custom, [the_elevator])
        gml_Script_shellworks_imgui_newbutton_doFunc("Editor Select", gml_Script_scr_go_to_room_custom, [level_select_side])
        gml_Script_shellworks_imgui_newbutton_doFunc("Soundtrack Player", gml_Script_scr_go_to_music_player)
        gml_Script_shellworks_imgui_newbutton_doFunc("Hat Select", gml_Script_scr_go_to_room_custom, [RoomOfHats])
        gml_Script_shellworks_imgui_newbutton_doFunc("Special Hat Select", gml_Script_scr_go_to_room_custom, [bonus_hat_room])
        if(global.shellworks_C10_secret)
            gml_Script_shellworks_imgui_newbutton_doFunc("C10", gml_Script_scr_go_to_room_custom, [C_03_fish_mania])

        /*
        imgui_separator_text("Basic Settings")
        gml_Script_shellworks_imgui_newslider("Master Volume", "setting_volume_master", 0, 1.5)
        gml_Script_shellworks_imgui_newslider("SFX Volume", "setting_volue_fx", 0, 1.5) //Yes, Jonas spelled "volume" wrong. Not my fault. :P
        gml_Script_shellworks_imgui_newslider("Music Volume", "setting_volue_music", 0, 1.5)
        gml_Script_shellworks_imgui_newslider("Squid Voice Volume", "setting_volue_voice", 0, 1.5)
        gml_Script_shellworks_imgui_newslider("Screenshake", "setting_screenshake", 0, 2)
        */

        imgui_separator_text("Display")
        gml_Script_shellworks_imgui_newbutton_doFunc("Fullscreen", scr_set_window_mode, [0])
        imgui_same_line()
        gml_Script_shellworks_imgui_newbutton_doFunc("Windowed", scr_set_window_mode, [3])
        gml_Script_shellworks_imgui_newboolean("Mute On Unfocused Window", "setting_mute_when_unfocused")


        imgui_separator_text("Savefile Backups")
        gml_Script_shellworks_imgui_newbutton_doFunc("Delete Old Savefile Backups", gml_Script_scr_delete_old_savefile_backups, [])
        imgui_text("INFO:\nThe vanilla game automatically backs up your save file whenever\nyou delete/reset a savefile.\nThis can build up after a while!\nThis button will delete all savefile\nbackups that are older than a month.")

        imgui_end()


        imgui_begin("SPEEDRUN FEATURES")

        imgui_separator_text("Display")
        gml_Script_shellworks_imgui_newboolean("Game Timer", "setting_speedrun_timer_game")
        gml_Script_shellworks_imgui_newboolean("Chapter Timer", "setting_speedrun_timer_chapter")
        gml_Script_shellworks_imgui_newboolean("Level Timer", "setting_speedrun_timer_level")
        gml_Script_shellworks_imgui_newboolean("Attempt Timer", "setting_speedrun_timer_attempt")
        gml_Script_shellworks_imgui_newboolean("Show FPS", "setting_speedrun_show_fps")
        gml_Script_shellworks_imgui_newboolean("Input Display", "setting_input_display")
        
        imgui_separator_text("Quick Keybinds")
        var prev_speedrun_reset_button = global.setting_speedrun_reset_button
        gml_Script_shellworks_imgui_newboolean("Quick Savefile Reset\n(CTRL+SHIFT+R)", "setting_speedrun_reset_button")
        if(global.setting_speedrun_reset_button != prev_speedrun_reset_button && global.setting_speedrun_reset_button){
            gml_Script_shellworks_imgui_createpopup_message("DANGEROUS FEATURE ENABLED!",
            "You have just enabled a SAVEFILE RESET KEYBIND!\n\nThis means that whenever you press CTRL+SHIFT+R, intentional or not, your savefile will be reset with auto-difficulty turned off.\n\nBE SURE TO TURN THIS FEATURE OFF WHEN YOU ARE NOT DOING SPEEDRUNS.\nI am not responsible for any savefile data loss.", "I understand.")
        }
        
        imgui_separator_text("Speedrun Challenge: Minimum Jumps")
        gml_Script_shellworks_imgui_newboolean("Total Jumps", "total_jumps_so_far_enabled")
        gml_Script_shellworks_imgui_newboolean("Attempt Jumps", "attempt_jumps_so_far_enabled")
        gml_Script_shellworks_imgui_newboolean("Total Half Jumps", "total_half_jumps_so_far_enabled")
        gml_Script_shellworks_imgui_newbutton_doFunc("Reset Jump Counters", gml_Script_reset_jump_counters, [])
        imgui_text("EXPLANATION:\nMinimum Jumps is a challenge in which you try\ntobeat the game (or a certain level)\nin as little jumps as possible.")
        imgui_text("Join the WYS Challenges discord\nto play and help with strategies!\n(Click the link under the\n\"Affiliates\" section of the Shellworks menu.)")
        
        imgui_end()



        imgui_begin("SHELLWORKS")

        imgui_separator_text("Important Links")
        gml_Script_shellworks_imgui_newbutton_doFunc("RGC Exists Discord\n(Report mod bugs here)", gml_Script_scr_open_link, ["https://discord.gg/96aukFY7Rx"])
        gml_Script_shellworks_imgui_newbutton_doFunc("Will You Snail Discord\n(Official)", gml_Script_scr_open_link, ["https://discord.gg/uM6ydJwFdw"])

        imgui_separator_text("Affiliate Links")
        gml_Script_shellworks_imgui_newbutton_doFunc("Snail's End\n(WYS's demon list)", gml_Script_scr_open_link, ["https://sites.google.com/view/snailsend/list"])
        gml_Script_shellworks_imgui_newbutton_doFunc("Snail's End Discord server", gml_Script_scr_open_link, ["https://discord.gg/2M34MHN2sK"])
        gml_Script_shellworks_imgui_newbutton_doFunc("WYS: The Movie\nDiscord server", gml_Script_scr_open_link, ["https://discord.gg/CyRxYHraqt"])
        gml_Script_shellworks_imgui_newbutton_doFunc("Goodbye AI (Fangame)\nDiscord server", gml_Script_scr_open_link, ["https://discord.gg/A5cHBPxEKP"])
        gml_Script_shellworks_imgui_newbutton_doFunc("Will You Speedrun\nDiscord server", gml_Script_scr_open_link, ["https://discord.gg/sTr5eaYfms"])
        gml_Script_shellworks_imgui_newbutton_doFunc("WYS Challenges\n(Blindfolded, Minimum Jumps, etc.)", gml_Script_scr_open_link, ["https://discord.gg/gF89zs2b7X"])
        
        imgui_separator_text("Shellworks Updates")
        var prevDoUpdates = global.shw_setting_do_updates
        gml_Script_shellworks_imgui_newboolean("Automatic Updates", "shw_setting_do_updates")
        if(global.shw_setting_do_updates != prevDoUpdates){
            gml_Script_scr_change_autoupdater(global.shw_setting_do_updates)
        }


        imgui_separator_text("GMSL")
        var prevShowConsole = global.setting_show_console
        gml_Script_shellworks_imgui_newboolean("Show Console", "setting_show_console")
        if(global.setting_show_console != prevShowConsole){
            toggle_console(global.setting_show_console)
        }
        imgui_end()

        

        imgui_begin("COLOR SCHEMES")
        
        imgui_separator_text("Import/Export")
        gml_Script_shellworks_imgui_newbutton_doFunc("Import Color Scheme", gml_Script_scr_import_color_scheme)
        
        imgui_separator_text("Color Editor")
        gml_Script_shellworks_imgui_newbutton_doFunc("Color Scheme Editor", gml_Script_shellworks_imgui_action_confirmColorMenuPopup)

        imgui_end()
    } else {
        gml_Script_shellworks_imgui_draw_colorScheme_menu()
    }

} else if(instance_exists(obj_shellworksUI_popup)){
    imgui_set_mouse_hidden(false)
} else {
    imgui_set_mouse_hidden(true)

    global.shellworks_imgui_time_menu_open = 0
}

with(obj_shellworksUI_popup){
    event_user(0)
}

with(obj_shellworksUI_popup){
    just_drew = false
}
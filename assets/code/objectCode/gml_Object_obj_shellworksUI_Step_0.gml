depth = -14000


with(global.inputaction_shellworks_openmenu){
    if(#cursed_inline_funcname_getpressedplus#()){
        global.shellworks_imgui_menuOpen = !global.shellworks_imgui_menuOpen
        global.shellworks_C10_secret = (irandom(10) == 0)

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
    


    imgui_begin("GAMEPLAY")
    
    imgui_separator_text("Special")
    gml_Script_shellworks_imgui_newboolean("Inverted Pump", "save_pump_is_inverted")
    gml_Script_shellworks_imgui_newboolean("Fixed Squid", "save_heart_fixed")
    
    imgui_separator_text("Cheats")
    gml_Script_shellworks_imgui_newboolean("Noclip", "invincible_mode")
    gml_Script_shellworks_imgui_newboolean("Self Destruct Invincibility", "restart_invincible_mode")
    gml_Script_shellworks_imgui_newboolean("Fuse Invincibility", "fuse_invincible_mode")
    gml_Script_shellworks_imgui_newboolean("Ball Invincibility", "ball_invincible_mode")
    gml_Script_shellworks_imgui_newboolean("Tower Defense Invincibility", "td_invincible_mode")
    gml_Script_shellworks_imgui_newboolean("Infinite Double Jumps", "infinite_jumps")
    gml_Script_shellworks_imgui_newreal("Player Speed", "cheat_player_speed")
    gml_Script_shellworks_imgui_newreal("Jump Height", "cheat_jump_height")
    
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
    gml_Script_shellworks_imgui_newboolean("All Objects Copyable", "setting_copy_tool_bypass")

    imgui_separator_text("Camera")
    gml_Script_shellworks_imgui_newreal("Minimum Zoom", "setting_camzoom_min")
    gml_Script_shellworks_imgui_newreal("Maximum Zoom", "setting_camzoom_max")

    imgui_separator_text("Shellworks")
    gml_Script_shellworks_imgui_newboolean("\"O for hotkeys\" message", "setting_show_hotkeys_overlay")

    if(room != level_editor){
        imgui_separator_text("Other")
        gml_Script_shellworks_imgui_newboolean("Manual Value Textbox", "setting_enter_value_manually")
        gml_Script_shellworks_imgui_newboolean("Squid In Editor", "setting_squid_in_editor")
    }


    imgui_end()

    imgui_begin("COSMETIC")

    imgui_separator_text("Accessibility")
    gml_Script_shellworks_imgui_newslider("Intense Backgrounds", "setting_intense_backgrounds", 0, 1)

    imgui_separator_text("Cutscenes")
    gml_Script_shellworks_imgui_newboolean("Epilepsy Warning", "setting_epilepsy_warning")
    gml_Script_shellworks_imgui_newboolean("Skip Title Animation", "setting_skip_title_animation")

    imgui_separator_text("Player Character")
    gml_Script_shellworks_imgui_newbutton_doFunc("Character Customization UI", gml_Script_scr_go_to_character_select)
    gml_Script_shellworks_imgui_newboolean("Unicorn Hat Pops Ball", "setting_unicorn_horn_ball_override")
    gml_Script_shellworks_imgui_newbutton_doFunc("Set Default Hat to Current", gml_Script_scr_set_default_hat, [global.save_equipped_hat])
    gml_Script_shellworks_imgui_newbutton_doFunc("Save Character", gml_Script_scr_save_character)
    imgui_same_line()
    gml_Script_shellworks_imgui_newbutton_doFunc("Load Character", gml_Script_scr_load_character)
    
    imgui_separator_text("Other")
    gml_Script_shellworks_imgui_newboolean("Legitimacy Marker", "setting_legitimacy_marker")
    gml_Script_shellworks_imgui_newboolean("Noclip Death Indicator", "setting_noclip_indicator")
    gml_Script_shellworks_imgui_newcolorpicker("Color Noclip Indicator", "setting_noclip_indicator_color")
    gml_Script_shellworks_imgui_newslider("Transparency Noclip Indicator", "setting_noclip_indicator_transparency", 0, 1)
    gml_Script_shellworks_imgui_newboolean("Input Display", "setting_input_display")
    

    /*
    imgui_separator_text("Novelties")
    gml_Script_shellworks_imgui_newboolean("Rendering Altogether", "enable_rendering")
    */

    imgui_end()

    imgui_begin("MISCELLANEOUS")

    imgui_separator_text("Rooms")
    gml_Script_shellworks_imgui_newbutton_doFunc("Level Select", gml_Script_scr_go_to_room_custom, [level_select])
    gml_Script_shellworks_imgui_newbutton_doFunc("Campaign Select", gml_Script_scr_go_to_room_custom, [the_elevator])
    gml_Script_shellworks_imgui_newbutton_doFunc("Editor Select", gml_Script_scr_go_to_room_custom, [level_select_side])
    gml_Script_shellworks_imgui_newbutton_doFunc("Soundtrack Player", gml_Script_scr_go_to_music_player)
    gml_Script_shellworks_imgui_newbutton_doFunc("Character Customization UI", gml_Script_scr_go_to_character_select)
    gml_Script_shellworks_imgui_newbutton_doFunc("Hat Select", gml_Script_scr_go_to_room_custom, [RoomOfHats])
    gml_Script_shellworks_imgui_newbutton_doFunc("Special Hat Select", gml_Script_scr_go_to_room_custom, [bonus_hat_room])
    if(global.shellworks_C10_secret)
        gml_Script_shellworks_imgui_newbutton_doFunc("C10", gml_Script_scr_go_to_room_custom, [C_03_fish_mania])

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
    
 

    imgui_end()

} else if(instance_exists(obj_shellworksUI_popup)){
    imgui_set_mouse_hidden(false)
} else {
    imgui_set_mouse_hidden(true)

    global.shellworks_imgui_time_menu_open = 0
}

with(obj_shellworksUI_popup){
    event_user(0)
}
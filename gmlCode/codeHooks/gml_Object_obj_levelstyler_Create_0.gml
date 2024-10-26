
var missing_schemes = []
var max_existing_scheme = 1
for(var colsche = 0; colsche < 10000; colsche++){
    if(directory_exists(("Colors/" + string((colsche + 1))))){
        max_existing_scheme = colsche + 1
    } else {
        array_push(missing_schemes, colsche + 1)
    }
}

to_rename = {}
for(var i = 1; i <= array_length(missing_schemes); i++){
    var c = missing_schemes[i - 1] 

    for(var j = c + 1; j <= max_existing_scheme; j++){
        var existing_val = variable_struct_get(to_rename, string(j))
        if(existing_val < 0 || is_undefined(existing_val)) existing_val = c
        variable_struct_set(to_rename, string(j), existing_val - 1)
    }
}

var names = variable_struct_get_names(to_rename)
for(var i = 0; i < array_length(names); i++){
    var og_name = names[i]
    var new_name = variable_struct_get(to_rename, og_name)
    gml_Script_scr_color_scheme_rename("Colors/" + string(og_name), string(new_name))

    if(real(og_name) == global.setting_color_scheme){
        global.setting_color_scheme = real(new_name)
    }
}

if(!file_exists("Colors/" + string(global.setting_color_scheme) + "/" + "Normal.txt")){
    gml_Script_shellworks_imgui_createpopup_message("Color scheme deleted!", "The selected color scheme was deleted!\nReverting to color scheme #2...", "Okay.")
    global.setting_color_scheme = 2
}

#orig#()

if global.save_pump_is_inverted
{
    if (object_index == obj_levelstyler)
    {
        if (x > -1000)
        {
            if (room != SecretPump)
            {
                if (room != menu)
                {
                    if (room != main_menu_dark)
                    {
                        if (room != EndGameCredits)
                        {
                            if (room != disclaimer_photoepilepsy)
                            {
                                if (room != disclaimer_playtest)
                                {
                                    if (room != level_editor)
                                    {
                                        if (room != level_editor_play_mode)
                                        {
                                            return false;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
if(variable_global_exists("part_type_playerTrail")){
    if (part_type_exists(global.part_type_playerTrail)){
        part_type_destroy(global.part_type_playerTrail)
    }
}
if(global.setting_player_trail == -1){
    col_player_trail_idk = col_player_trail
} else {
    col_player_trail_idk = global.setting_player_trail
}
global.part_type_playerTrail = part_type_create()
part_type_color1(global.part_type_playerTrail, col_player_trail_idk)
part_type_life(global.part_type_playerTrail, 50, 70)
part_type_alpha3(global.part_type_playerTrail, 0.05, 0.03, 0)
part_type_sprite(global.part_type_playerTrail, spr_flare_small, 0, 0, 1)
part_type_speed(global.part_type_playerTrail, 0.4, 0.6, 0, 0)
part_type_orientation(global.part_type_playerTrail, 0, 360, 0, 0, 0)
part_type_direction(global.part_type_playerTrail, 0, 360, 0, 0)
part_type_size(global.part_type_playerTrail, 1.25, 1.25, 0, 0)

global.levelstyler_colors_need_to_be_reloaded = true
just_started_level = true
alarm[4] = 1
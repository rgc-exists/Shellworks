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

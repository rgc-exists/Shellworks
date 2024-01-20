if (selected_state == 1 && global.setting_skip_title_animation)
{
    scr_fade_to_room(global.gotolevel_after_start_screen)
} else {
    #orig#()
}
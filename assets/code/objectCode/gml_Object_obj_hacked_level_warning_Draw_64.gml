if(time_spent_watching < 30){
    draw_set_color(c_white)
    draw_set_alpha(1)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text_transformed(1920 / 2, 1080 * 0.35, "LOADING AD...", 3, 3, 0)
    draw_set_color(c_lime)
    draw_rectangle(1920 * 0.33, 1920 * 0.15 - 20, 1920 * 0.66, 1920 * 0.15, false)
    draw_set_color(c_white)
    draw_rectangle(1920 * 0.33, 1920 * 0.15 - 20, 1920 * 0.33 + (1920 * 0.34 * (time_spent_watching / 30)), 1920 * 0.15, true)
} else {
    //loosely based on https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Drawing/Videos/video_draw.htm
    var _data = video_draw()
    var _status = _data[0]

    if(time_spent_watching > 360){
        if(keyboard_check_pressed(vk_space)){
            _status = -1
        }
    }

    if (_status == 0)
    {
        var _surface = _data[1]

        draw_surface_stretched(_surface, 0, 0, 1920, 1080)

        if(time_spent_watching > 360){
            draw_set_color(c_white)
            draw_set_alpha(1)
            draw_set_halign(fa_left)
            draw_set_valign(fa_middle)
            scr_draw_text_in_box("PRESS SPACE TO SKIP", 400, 250, 1, -1, 1520, 830, false)
        }
    } else {
        video_close()
        with(obj_persistent){
            gml_Script_scr_close_april_fools_ad()
        }
    }
}
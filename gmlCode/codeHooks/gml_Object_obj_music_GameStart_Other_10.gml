if(global.setting_skip_title_animation){
    play_music = 304
    play_music_volume_multi = 0
    is_jingle = 1
    fade_in_speed = 1
    with (obj_music_parent)
        fade_out_speed /= 2
    fade_out_speed = 0.001
    audio_play_sound(sou_game_start, 0, false)
} else {
    #orig#()
}
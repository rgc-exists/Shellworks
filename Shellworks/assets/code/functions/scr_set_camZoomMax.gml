if(global.setting_camzoom_max >= 20){
    global.setting_camzoom_max += argument0 * 10
} else if(global.setting_camzoom_max >= 10){
    global.setting_camzoom_max += argument0 * 2 * 2
} else if(global.save_game_speed >= 5){
    global.setting_camzoom_max += argument0 * 2
} else {
    global.setting_camzoom_max += argument0 / 2 * 2
}
global.setting_camzoom_max = clamp(global.setting_camzoom_max, 1, 500)
sound = audio_play_sound(sou_click, 1, false)
audio_sound_gain_fx(sound, 1, 0)
scr_save_settings()
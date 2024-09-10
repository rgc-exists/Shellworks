if(global.save_game_speed >= .5){
    global.save_game_speed += argument0
} else if(global.save_game_speed >= .25){
    global.save_game_speed += argument0 / 2
} else {
    global.save_game_speed += argument0 / 10
}
global.save_game_speed = clamp(global.save_game_speed, 0.01, 100)
sound = audio_play_sound(sou_click, 1, false)
audio_sound_gain_fx(sound, 1, 0)
room_speed = (60 * global.save_game_speed)
scr_save_settings()
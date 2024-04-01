global.input_confirm_pressed = 0
global.input_jump_pressed = 0
global.input_jump = 0
global.input_x = 0
global.input_x_pressed = 0
global.input_confirm_pressed = 0
global.input_down = 0
global.input_down_pressed = 0
room_persistent = true
roomBeforeMenu = room
audio_pause_all()
scr_save_settings()
room_goto(disclaimer_hackedlevel)
sound = audio_play_sound(sou_click, 1, false)
audio_sound_gain_fx(sound, 1, 0)
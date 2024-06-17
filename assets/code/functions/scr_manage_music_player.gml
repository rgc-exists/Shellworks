event_user(2)

if(instance_exists(obj_player)){
    instance_destroy(obj_player)
    instance_destroy(obj_music_disco)
    instance_destroy(obj_ai_level_00)
    instance_destroy(obj_goal_gradient)
    instance_destroy(obj_disco_light)
    instance_destroy(instance_find(obj_wall, 0))
}
with(obj_performance_test_snail){
    image_speed = 0
    image_index = 4
}
if(!audio_exists(global.cur_musroom_sound) || global.input_x_pressed != 0){
    if(audio_exists(global.cur_musroom_sound)){
        if(audio_is_playing(global.cur_musroom_sound)){
            audio_stop_sound(global.cur_musroom_sound)
        }
    }
    if(global.input_x_pressed > 0){
        global.cur_musroom_song += 1
        if(global.cur_musroom_song >= array_length(global.musroom_songs)){
            global.cur_musroom_song = 0
        }
    }
    if(global.input_x_pressed < 0){
        global.cur_musroom_song -= 1
        if(global.cur_musroom_song < 0){
            global.cur_musroom_song = array_length(global.musroom_songs) - 1
        }
    }
    global.cur_musroom_sound = audio_play_sound(global.musroom_songs[global.cur_musroom_song], 0, true)
}
draw_set_halign(1)
draw_set_valign(1)
draw_set_color(c_white)
draw_text_ext(camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) / 2, global.musroom_names[global.cur_musroom_song], 0, 9999)

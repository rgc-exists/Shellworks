with (obj_music_parent)
    instance_destroy()
if(room == menu){
    with (obj_persistent)
    {
        sound = audio_play_sound(sou_game_start, 1, false)
        audio_sound_gain_fx(sound, 1, 0)
        scr_save_settings()
        inMainMenu = 0
        go_to_a_room_next = 1
        room_to_goto_next = bubbleg_dark_copy_me
        room_goto(roomBeforeMenu)
        room_persistent = false
        roomBeforeMenu = -1
        audio_resume_all()
    }
} else {
    room_goto(bubbleg_dark_copy_me)
}
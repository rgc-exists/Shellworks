with (obj_persistent)
{
    scr_save_game_archive()
    scr_save_settings()
    inMainMenu = 0
    with (obj_aivl_parent)
        instance_destroy()
    with (obj_music_parent)
        instance_destroy()
    audio_stop_all()
    sound = audio_play_sound(sou_game_start, 1, false)
    audio_sound_gain_fx(sound, 1, 0)
    scr_save_game_archive()
    scr_editor_savegames_delete_file()
    scr_load_empty_game()
    room_goto(T_01_first_contact)
    global.save_auto_difficulty = false
}
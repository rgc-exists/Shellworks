with (obj_music_parent)
    instance_destroy()
with (obj_persistent)
{
    gml_Script_scr_save_settings()
    inMainMenu = 0
    room_goto(disco_copy_me)
    room_persistent = false
    roomBeforeMenu = -1
    audio_resume_all()
}
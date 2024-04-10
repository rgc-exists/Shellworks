kkey = ds_map_find_first(global.loca_map_all_audio_voice_lines)
for (iw = 0; iw < ds_map_size(global.loca_map_all_audio_voice_lines); iw++)
{
    if(!is_undefined(ds_map_find_value(global.loca_map_all_audio_voice_lines, kkey))){
        audio_destroy_stream(ds_map_find_value(global.loca_map_all_audio_voice_lines, kkey))
        kkey = ds_map_find_next(global.loca_map_all_audio_voice_lines, kkey)
    }
}
ds_map_clear(global.loca_map_all_audio_voice_lines)
if (!(!scr_launch_param("lazyloadvl"))) //UMT is so good at decompiling WOOOOOOOOOOOW
    return;
kkey = ds_map_find_first(global.loca_ds_map_text_translations)
for (iw = 0; iw < ds_map_size(global.loca_ds_map_text_translations); iw++)
{
    sound_file_name = string_replace(kkey, ":", "_")
    soundstream = audio_create_stream((((((global.loca_directory_main + "/") + global.setting_loca_voice) + "/") + sound_file_name) + ".ogg"))
    if audio_exists(soundstream)
        ds_map_add(global.loca_map_all_audio_voice_lines, kkey, soundstream)
    else
        ds_map_add(global.loca_map_all_audio_voice_lines, kkey, 17)
    kkey = ds_map_find_next(global.loca_ds_map_text_translations, kkey)
}
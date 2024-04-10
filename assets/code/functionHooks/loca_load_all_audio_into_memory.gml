if(global.just_loaded_savestate){
    //show_message("CLEARING THE FUCKING LIST")
    if(ds_exists(global.loca_map_all_audio_voice_lines, ds_type_map)){
        ds_map_destroy(global.loca_map_all_audio_voice_lines)
    }
    global.loca_map_all_audio_voice_lines = ds_map_create()
}

return #orig#()
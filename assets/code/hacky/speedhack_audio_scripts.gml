function SPH_play_sound(argument0, argument1, argument2, argument3, argument4, argument5, argument6){
    pitch = pitch * global.save_game_speed
    audio_play_sound(argument0, argument1, argument2, argument3, argument4, argument5, argument6)
}

/*
//audio_play_sound_ext doesnt exist for WYS for some reason? Maybe its an older runtime version?
function SPH_play_sound_ext(params){
    if(variable_struct_exists(params, "pitch")){
        variable_struct_set(params, "pitch", variable_struct_get(params, "pitch") * global.save_game_speed)
    }
    audio_play_sound_ext(params)
}
*/

function SPH_play_sound_at(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8){
    var sound = audio_play_sound_at(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
    audio_sound_pitch(sound, global.save_game_speed)
}

function SPH_play_sound_on(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7){
    pitch = pitch * global.save_game_speed
    audio_play_sound_on(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7)
}

function SPH_sound_pitch(argument0, argument1){
    pitch = pitch * global.save_game_speed
    audio_sound_pitch(argument0, argument1)
}

function SPH_sound_get_pitch(argument0){
    return audio_sound_get_pitch(argument0 / global.save_game_speed)
}
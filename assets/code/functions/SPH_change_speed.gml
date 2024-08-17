var previous_speed = argument0
var new_speed = argument1
for(var i = 0; i < 50000; i++){
    if(audio_exists(i)){
        var pitch = audio_sound_get_pitch(i) * (new_speed / previous_speed)
        audio_sound_pitch(i, pitch)
    }
}
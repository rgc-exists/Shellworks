if(keyboard_check(vk_lalt)){
    if (argument1 == 0)
    {
    }
    argument0.image_angle -= (round(argument1) * 15)
    while (argument0.image_angle >= 360)
        argument0.image_angle -= 360
    while (argument0.image_angle < 0)
        argument0.image_angle += 360
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, ((4 + random(0.5)) + (sign(argument1) * 0.8)))
} else if(keyboard_check(vk_ralt)){
    if (argument1 == 0)
    {
    }
    argument0.image_angle -= (round(argument1) * 1)
    while (argument0.image_angle >= 360)
        argument0.image_angle -= 360
    while (argument0.image_angle < 0)
        argument0.image_angle += 360
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, ((4 + random(0.5)) + (sign(argument1) * 0.8)))
} else if(keyboard_check(ord("V"))){
    if (argument1 == 0)
    {
    }
    argument0.image_yscale = (-argument0.image_yscale)
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, (4 + random(0.5)))
} else if(keyboard_check(ord("H"))){
    if (argument1 == 0)
    {
    }
    argument0.image_xscale = (-argument0.image_xscale)
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, (4 + random(0.5)))
} else {
    #orig#(argument0, argument1)
}
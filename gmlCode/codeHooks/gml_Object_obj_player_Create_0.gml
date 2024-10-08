if(room == disco_copy_me){ //If is snail from the music player room
    audio_falloff_set_model(5)
    dragging_power_connection = -1
    gamepad_rumble = 0
    speed_mult = 1
    gun_equipped = 0
    gun_cooldown = 0
    audio_listener_orientation(0, 0, 1, 0, -1, 0)
    snail_voice_sound = -1
    reading_file = -1
    lookdir = 1
    lookdir_start = 1
    lookdir_smooth = lookdir
    scr_move_like_a_snail_ini()
    victory = -1
    dead = -1
    particletraveldist = 0
    xlast = x
    ylast = y
    nomovement_timer = 0
    eye1 = instance_create_layer(x, y, "Player_Eyes", obj_snaili_eye)
    eye1.eye = 1
    eye2 = instance_create_layer(x, y, "Player_Eyes", obj_snaili_eye)
    eye2.eye = 2
    house_height = 1
    house_width = 1
    house_tilt = 0
    lockmovement = 40
    wind_sound_fall_volume = 0
    wind_sound_fall = audio_play_sound(sou_wind_high, 1, true)
    audio_sound_gain_fx(wind_sound_fall, 0, 0)
    wind_sound_slither_volume = 0
    wind_sound_slither = audio_play_sound(sou_slither_no_paper, 1, true)
    audio_sound_gain_fx(wind_sound_slither, 0, 0)
    winter = 0
    col_snail_outline = 0
    col_snail_body = 0
    col_snail_shell = 0
    col_snail_eye = 0
    if instance_exists(obj_levelstyler)
    {
        if variable_instance_exists(obj_levelstyler.id, "col_snail_body")
            event_user(0)
    }
    time = 0
    active_time = 0
    inbubble_flash = 0
    hspeed_last = 0
    in_water_current = 0
    bubbleindicator = 0
    allow_restarts = 1
    bonus_speed_by_conveyor = 0
    extra_speed_mode = 0
    if (room == level_select || room == story_library || room == community_campaign_lvlselect)
        extra_speed_mode = 1
    started_playing = 0
    holding_jump_without_moving_timer = 0
    glitch_mode_and_dir = -1
    global.player_using_glitch_timer = 0
    speedboosted = 0
    speedboosted_grace_period = -1
    max_smilies = 0
    collected_smilies = 0
    smilie_counters_played = 0
    infinijumptime = 0
    handled_custom_exit = 0
    is_first_frame = true
} else {
    global.save_speedrun_timer_attempt = 0
    #orig#()
    just_hit_fuse = false
    is_first_frame = true

    global.attempt_jumps_so_far = 0

    if(global.room_remember != room && room != menu){
        global.total_half_jumps_so_far_can_change = true
    }
    if (global.input_jump && (!global.input_jump_pressed) && global.total_half_jumps_so_far_can_change){
        global.total_jumps_so_far += 0.5
        global.attempt_jumps_so_far += 0.5
        global.total_half_jumps_so_far += 1
    }

}
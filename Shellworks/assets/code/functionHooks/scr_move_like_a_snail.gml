in_conveyor = 0
inputx = clamp(argument0, -1, 1)
inputjump = argument1
inputjumppress = argument2
snailtype = argument3
if underwater
{
    if inbubble
        vspeed -= 0.05
    else if (vspeed < 0)
        vspeed += 0.25
    else
        vspeed += 0.5
    if (vspeed > 7)
        vspeed = 7
}
else if inbubble
{
    vspeed -= 0.3
    vspeed *= 0.97
}
else
    vspeed += 1.5
water_current = collision_point(x, y, obj_underwater_current, 1, 1)
timesincelastjump++
if instance_exists(water_current)
{
    hspeed += lengthdir_x(0.5, water_current.image_angle)
    vspeed += lengthdir_y(1.3, water_current.image_angle)
    if (timesincelastjump < 30)
        vspeed *= (0.95 + (0.05 * abs(lengthdir_x(1, water_current.image_angle))))
    else
        vspeed *= 0.95
    if (snailtype == 0)
    {
        in_water_current = lerp(in_water_current, 1, 0.1)
        if (global.player_underwater_current_timer < 100)
            global.player_underwater_current_timer += 1
    }
}
else if (snailtype == 0)
{
    in_water_current = lerp(in_water_current, 0, 0.05)
    if (global.player_underwater_current_timer > 0)
    {
        global.player_underwater_current_timer -= 0.3
        if (groundedremember > 0)
            global.player_underwater_current_timer -= 1
    }
}
if (underwater ? vspeed < 0 : vspeed < -3.5)
{
    if (inputjump == 0)
    {
        if (inbubble == 0)
        {
            if (!global.save_fixed_jump_height)
            {
                if underwater
                    vspeed += 0.5
                else
                    vspeed += 2
            }
        }
    }
}
if underwater
{
    hspeed += (inputx * 0.45) * global.cheat_player_speed
    hspeed *= 0.95
}
else if inbubble
{
    hspeed += (inputx * 0.4) * global.cheat_player_speed
    hspeed *= 0.97
    hspeed = clamp(hspeed, -12 * global.cheat_player_speed, 12 * global.cheat_player_speed)
}
else
    hspeed = (inputx * 10) * global.cheat_player_speed
if place_meeting(x, y, obj_conveyor_belt)
{
    if (!underwater)
        hspeed += (global.conveyor_belt_speed * sign(global.conveyor_belt_direction))
    else
        hspeed += ((global.conveyor_belt_speed * sign(global.conveyor_belt_direction)) * 0.1)
    if (snailtype == 0)
    {
        if (global.player_on_conveyor_timer <= 0)
            global.player_on_conveyor_timer = 1
    }
    bonus_speed_by_conveyor = (global.conveyor_belt_speed * sign(global.conveyor_belt_direction))
}
groundedremember--
jumpremember--
if (place_free(x, (y + 10)) == 0)
{
    groundedremember = 5
    airjumps = 1
    if (snailtype == 0)
    {
        global.input_analysis_performing_jump_timer = 0
        if (!(place_meeting(x, (y + 5), obj_conveyor_belt)))
            global.player_on_conveyor_timer = 0
    }
}
if inputjumppress
    jumpremember = 10
if inbubble
{
    if (jumpremember >= 0)
    {
        jumpremember = 1
        groundedremember = -1
        airjumps = 2
        inbubble = 0
        if (snailtype == 0)
        {
            sound = audio_play_sound(choose(sou_BubbleLeave_A, sou_BubbleLeave_B), 0.8, false)
            audio_sound_gain_fx(sound, 0.75, 0)
            audio_sound_pitch(sound, (0.85 + random(0.3)))
            scr_exit_bubble()
        }
    }
}
if (groundedremember >= 0 || airjumps > 0)
{
    if (jumpremember >= 0)
    {
        vspeed = -25  * global.cheat_jump_height
        if (snailtype == 0)
        {
            if (global.input_analysis_performing_jump_timer <= 0)
                global.input_analysis_performing_jump_timer = 1
            if global.underwater
            {
                sound = audio_play_sound(choose(sou_UnderwJump_01, sou_UnderwJump_02, sou_UnderwJump_03, sou_UnderwJump_04, sou_UnderwJump_05, sou_UnderwJump_06), 0.9, false)
                audio_sound_gain_fx(sound, 1.2, 0)
            }
            else if (winter && groundedremember >= 0)
            {
                if winter
                {
                    if (global.setting_visual_details != 0)
                    {
                        part_type_speed(global.part_type_snow, 2, 11, 0, 0)
                        part_type_direction(global.part_type_snow, (direction - 10), (direction + 10), 0, 0)
                        part_type_gravity(global.part_type_snow, 0.4, 270)
                        repeat (45)
                        {
                            part_type_life(global.part_type_snow, 5, (10 + random(50)))
                            part_particles_create(global.part_sys_fx, ((x - 20) + random(40)), (y + 15), global.part_type_snow, 1)
                        }
                    }
                }
                sound = audio_play_sound(choose(sou_snowJump1, sou_snowJump2, sou_snowJump3), 0.9, false)
                audio_sound_gain(sound, 0.2, 0)
                audio_sound_pitch(sound, (0.9 + random(0.2)))
            }
            else
            {
                sound = audio_play_sound(choose(sou_jump_01, sou_jump_02, sou_jump_03, sou_jump_04, sou_jump_05, sou_jump_06), 0.9, false)
                audio_sound_gain_fx(sound, 0.2, 0)
            }
            if (random(1) < 0.5)
            {
                if audio_is_playing(snail_voice_sound)
                    audio_stop_sound(snail_voice_sound)
                if (!global.underwater)
                {
                    snail_voice_sound = audio_play_sound(choose(sou_cuteJump_01, sou_cuteJump_02, sou_cuteJump_03, sou_cuteJump_04, sou_cuteJump_05, sou_cuteJump_06, sou_cuteJump_07), 0.9, false)
                    audio_sound_gain_fx(snail_voice_sound, 0.05, 0)
                    audio_sound_pitch(snail_voice_sound, (0.45 + random(0.1)))
                }
                else
                {
                    snail_voice_sound = audio_play_sound(choose(sou_UnderwCuteJump_01, sou_UnderwCuteJump_02, sou_UnderwCuteJump_03, sou_UnderwCuteJump_04, sou_UnderwCuteJump_05, sou_UnderwCuteJump_06, sou_UnderwCuteJump_07), 0.9, false)
                    audio_sound_gain_fx(snail_voice_sound, 0.35, 0)
                    audio_sound_pitch(snail_voice_sound, (0.45 + random(0.1)))
                }
            }
            if (groundedremember < 0)
            {
                airjumps--
                audio_sound_gain_fx(sound, 0.4, 0)
                audio_sound_pitch(sound, 1.25)
            }
            else
                timesincelastjump = 0
        }
        else if (groundedremember < 0)
            airjumps--
        jumpremember = -1
        groundedremember = -1
        if (snailtype == 0)
        {
            if (gun_equipped == 1)
            {
                gun_cooldown = 5
                idmerk = instance_create_layer((x - (lookdir * 13)), y, "Player", obj_sh_projectile)
                idmerk.vspeed -= (20 * speed_mult)
                idmerk.hspeed = (2 * speed_mult)
                idmerk = instance_create_layer((x - (lookdir * 13)), y, "Player", obj_sh_projectile)
                idmerk.vspeed -= (20 * speed_mult)
                idmerk.hspeed = (4 * speed_mult)
                idmerk = instance_create_layer((x - (lookdir * 13)), y, "Player", obj_sh_projectile)
                idmerk.vspeed -= (20 * speed_mult)
                idmerk.hspeed = (-2 * speed_mult)
                idmerk = instance_create_layer((x - (lookdir * 13)), y, "Player", obj_sh_projectile)
                idmerk.vspeed -= (20 * speed_mult)
                idmerk.hspeed = (-4 * speed_mult)
                if global.underwater
                    sound = audio_play_sound(sou_UnderwPop_04, 0.9, false)
                else
                    sound = audio_play_sound(sou_shooter_plop_04, 0.9, false)
                audio_sound_gain_fx(sound, 1, 0)
            }
            else if (gun_equipped == 2)
            {
                gun_cooldown = 5
                for (vsp = -5; vsp <= 5; vsp += 10)
                {
                    idmerk = instance_create_layer((x - (lookdir * 13)), (y - 10), "Player", obj_sh_projectile)
                    idmerk.hspeed = ((26 * lookdir) * speed_mult)
                    old_yscale = idmerk.image_yscale
                    idmerk.image_yscale = idmerk.image_xscale
                    idmerk.image_xscale = old_yscale
                    idmerk.vspeed = (vsp * speed_mult)
                    idmerk.rotated = 1
                }
                if global.underwater
                    sound = audio_play_sound(sou_UnderwPop_04, 0.9, false)
                else
                    sound = audio_play_sound(sou_shooter_plop_04, 0.9, false)
                audio_sound_gain_fx(sound, 1, 0)
            }
            else if (gun_equipped == 3)
            {
                if (airjumps == 0)
                {
                    gun_cooldown = 5
                    idmerk = instance_create_layer((x - (lookdir * 13)), y, "Player", obj_sh_projectile)
                    idmerk.vspeed = (20 * speed_mult)
                    idmerk.hspeed = (2 * speed_mult)
                    idmerk = instance_create_layer((x - (lookdir * 13)), y, "Player", obj_sh_projectile)
                    idmerk.vspeed = (20 * speed_mult)
                    idmerk.hspeed = (4 * speed_mult)
                    idmerk = instance_create_layer((x - (lookdir * 13)), y, "Player", obj_sh_projectile)
                    idmerk.vspeed = (20 * speed_mult)
                    idmerk.hspeed = (-2 * speed_mult)
                    idmerk = instance_create_layer((x - (lookdir * 13)), y, "Player", obj_sh_projectile)
                    idmerk.vspeed = (20 * speed_mult)
                    idmerk.hspeed = (-4 * speed_mult)
                    if global.underwater
                        sound = audio_play_sound(sou_UnderwPop_04, 0.9, false)
                    else
                        sound = audio_play_sound(sou_shooter_plop_04, 0.9, false)
                    audio_sound_gain_fx(sound, 1, 0)
                }
            }
            else if (gun_equipped == 5)
            {
                gun_cooldown = 5
                for (vsp = -5; vsp <= 5; vsp += 10)
                {
                    idmerk = instance_create_layer((x - ((lookdir * -1) * 13)), (y - 10), "Player", obj_sh_projectile)
                    idmerk.hspeed = ((26 * (lookdir * -1)) * speed_mult)
                    old_yscale = idmerk.image_yscale
                    idmerk.image_yscale = idmerk.image_xscale
                    idmerk.image_xscale = old_yscale
                    idmerk.vspeed = (vsp * speed_mult)
                    idmerk.rotated = 1
                }
                if global.underwater
                    sound = audio_play_sound(sou_UnderwPop_04, 0.9, false)
                else
                    sound = audio_play_sound(sou_shooter_plop_04, 0.9, false)
                audio_sound_gain_fx(sound, 1, 0)
            }
        }
        if underwater
        {
            vspeed = -11
            if (snailtype == 0)
            {
                if (global.setting_visual_details > 0)
                {
                    repeat (5)
                        part_particles_create(global.part_sys_fx, ((x - random(40)) + 20), ((y - random(20)) + 20), global.part_type_underwBubbles, 1)
                }
            }
        }
        if(global.setting_player_trail == -1){
            col_player_trail_idk = obj_levelstyler.col_player_trail
        } else {
            col_player_trail_idk = global.setting_player_trail
        }
        if (snailtype == 0)
        {
            idmerk = instance_create_layer(x, (y + 20), "Fx", obj_fx_flare)
            idmerk.decay = 0.8
            idmerk.image_blend = col_player_trail_idk
            idmerk.image_xscale = 0.25
            idmerk.image_yscale = 0.25
            idmerk.vspeed = 8
            idmerk = instance_create_layer(x, (y + 20), "Fx", obj_fx_flare)
            idmerk.decay = 0.9
            idmerk.image_blend = col_player_trail_idk
            idmerk.image_xscale = 0.25
            idmerk.image_yscale = 0.25
            idmerk.vspeed = 3
            idmerk = instance_create_layer(x, (y + 20), "Fx", obj_fx_flare)
            idmerk.decay = 0.95
            idmerk.image_blend = col_player_trail_idk
            idmerk.image_xscale = 0.25
            idmerk.image_yscale = 0.25
            idmerk.vspeed = 0
        }
    }
}
if (place_free((x + hspeed), y) == 0)
{
    if (snailtype == 0 || simulte_movements_on_ramps)
    {
        if (place_free((x + hspeed), (y - 10)) && (!(place_free(x, (y + 5)))))
        {
            y -= 10
            x += hspeed
            move_contact_solid(270, -1)
            x -= hspeed
            vspeed = min(vspeed, 0)
        }
        else
        {
            if (hspeed > 0)
                move_contact_solid(0, -1)
            else
                move_contact_solid(180, -1)
            hspeed = 0
        }
    }
    else
    {
        if (hspeed > 0)
            move_contact_solid(0, -1)
        else
            move_contact_solid(180, -1)
        hspeed = 0
    }
}
if (place_free(x, (y + vspeed)) == 0)
{
    if (vspeed > 0)
    {
        if (snailtype == 0)
        {
            if (vspeed > 7)
            {
                if global.underwater
                    sound = audio_play_sound(choose(sou_UnderwLanding_01, sou_UnderwLanding_02, sou_UnderwLanding_03), 0.7, false)
                else if winter
                {
                    sound = audio_play_sound(choose(sou_snowLand1, sou_snowLand2, sou_snowLand3, sou_snowLand4), 0.7, false)
                    if (global.setting_visual_details > 0)
                    {
                        part_type_speed(global.part_type_snow, 0, (speed * 0.25), 0, 0)
                        part_type_direction(global.part_type_snow, (direction - 40), (direction + 40), 0, 0)
                        repeat (25)
                        {
                            part_type_gravity(global.part_type_snow, (0.1 + random(0.3)), 270)
                            part_type_life(global.part_type_snow, 5, (10 + random(50)))
                            part_particles_create(global.part_sys_fx, ((x - 20) + random(40)), (y + 15), global.part_type_snow, 1)
                        }
                    }
                }
                else
                    sound = audio_play_sound(choose(sou_landing_1, sou_landing_2, sou_landing_3), 0.7, false)
                vol = (clamp(((vspeed - 7) * 0.03), 0, 0.5) * 0.75)
                audio_sound_gain_fx(sound, (vol * vol), 0)
                audio_sound_pitch(sound, (0.8 + (vol * 0.4)))
                if (vspeed > 35)
                    gamepad_rumble = max(gamepad_rumble, 0.2)
            }
        }
        move_contact_solid(270, -1)
    }
    else if inbubble
    {
        if (snailtype == 0)
        {
            sound = audio_play_sound(choose(sou_BubbleLeave_A, sou_BubbleLeave_B), 0.8, false)
            audio_sound_gain_fx(sound, 0.75, 0)
            audio_sound_pitch(sound, (2 + random(0.2)))
            scr_exit_bubble()
        }
        inbubble = 0
        airjumps = 1
    }
    else
    {
        move_contact_solid(90, -1)
        if (snailtype == 0)
        {
            if global.underwater
            {
                sound = audio_play_sound(choose(sou_CeilingTouch_A_underw, sou_CeilingTouch_B_underw, sou_CeilingTouch_C_underw), 0.2, false)
                audio_sound_gain_fx(sound, (abs(vspeed) / 18), 0)
                audio_sound_pitch(sound, (0.85 + random(0.3)))
            }
            else
            {
                sound = audio_play_sound(choose(sou_CeilingTouch_A, sou_CeilingTouch_B, sou_CeilingTouch_C), 0.2, false)
                audio_sound_gain_fx(sound, (abs(vspeed) / 120), 0)
                audio_sound_pitch(sound, (1.7 + random(0.3)))
            }
            if (global.setting_visual_details >= 2)
            {
                repeat round(abs((vspeed / 4)))
                    part_particles_create(global.part_sys_fx, ((x - random(20)) + 10), (y - 20), global.part_type_ceilingTouch, 1)
            }
        }
    }
    vspeed = 0
}
if (place_free((x + hspeed), (y + vspeed)) == 0)
    hspeed = 0

if(global.infinite_jumps){
    airjumps = 1
}
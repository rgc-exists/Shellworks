#orig#()


if (player_exists || (room == EndGameCredits && global.credits_mode != 0) || room == menu)
{
    speed_run_timer_size += 0.2
    speed_run_timer_size = min(speed_run_timer_size, 1.2)

    if global.setting_speedrun_timer_attempt
    {
        speed_run_timer_y += ((35 * speed_run_timer_size) + 25)
        scr_draw_timer(20, speed_run_timer_y, global.save_speedrun_timer_attempt, speed_run_timer_size, speed_run_alpha, srcol)
        speedrun_timer_game_width = str_timer_WIDTH
    }
}



if(room == disco_copy_me){
    gml_Script_scr_manage_music_player()
} else {
    if(audio_exists(global.cur_musroom_sound)){
        if(audio_is_playing(global.cur_musroom_sound)){
            audio_stop_sound(global.cur_musroom_sound)
        }
    }
}
if(room == level_editor){
    if(instance_exists(obj_lvledit_save_loader) || obj_level_editor.tools_widnow_open || global.onscreen_keyboard_enabled || global.editor_input_disabled){
        global.hotkeys_shown = false
    } else {
        show_hotkeys_tip--;
        if(show_hotkeys_tip > 0){
            if(global.setting_show_hotkeys_overlay){
                draw_set_color(c_black)
                draw_set_alpha(0.6 * clamp(show_hotkeys_tip / 100, 0, 1))
                draw_rectangle(0, camera_get_view_height(camera_get_active()) - 43, 1190, camera_get_view_height(camera_get_active()), false)
                draw_set_halign(fa_left)
                draw_set_valign(fa_top)
                draw_set_font(font_aiTalk)
                draw_set_color(c_white)
                draw_set_alpha(clamp(show_hotkeys_tip / 100, 0, 1))
                scr_draw_text_in_box("Press O to show a list of Shellworks hotkeys.", 1200, 30, 1, -1, 10, camera_get_view_height(camera_get_active()) - 27, false)
            }
        }

        if(keyboard_check_pressed(ord("O")) && !keyboard_check(ord("Y"))){
            global.hotkeys_shown = !global.hotkeys_shown
        }
        if(global.hotkeys_shown){
            draw_set_color(c_black)
            draw_set_alpha(0.6)
            draw_rectangle(0, 0, camera_get_view_width(camera_get_active()), camera_get_view_height(camera_get_active()), false)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            var hotkeys_message = "SHELLWORKS HOTKEYS

HOLD WHILE PLACING:
LEFT_ALT - No size limit
RIGHT_ALT - Fill with tiles
B - Fill with stripes
C - Wall-like pattern
Z - Place multiple players (only nessecary of the \"Place multiple players\" setting is off.)
X - Delete ALL object types (like you are holding the delete tool)

HOLD WHILE ROTATING:
LEFT_ALT - Rotate 15 degrees
RIGHT_ALT - Rotate 1 degree
H - Flip horizontally 
V - Flip vertically

MISC:
O - Show/hide list of hotkeys


PRESS O TO CLOSE"
            draw_set_font(font_aiTalk)
            draw_set_color(c_white)
            draw_set_alpha(1)
            scr_draw_text_in_box(hotkeys_message, camera_get_view_width(camera_get_active()) - 50, camera_get_view_height(camera_get_active()) - 50, 1, -1, 50, 50, false)
        }
    }
} else {
    global.hotkeys_shown = false
}
draw_set_alpha(1)

if(global.setting_legitimacy_marker){
    if(global.is_legit_right_now){
        draw_set_color(make_color_rgb(0, 150, 0))
    } else {
        draw_set_color(make_color_rgb(150, 0, 0))
    }
    draw_set_alpha(0.75)
    draw_rectangle(2, 2, 7, 7, false)
    draw_set_alpha(0.9)
    draw_set_color(c_black)
    draw_rectangle(2, 2, 7, 7, true)
}


if(global.setting_input_display){
    if(room != level_editor && room != empty_start_room && room != disclaimer_photoepilepsy){
        if(global.input_analysis_using_gamepad){
            //Insert gamepad input display here
            draw_set_color(c_white)
            draw_set_alpha(.8)
            draw_set_font(global.font_aiTalk)
            draw_set_halign(fa_right)
            draw_set_valign(fa_top)
            draw_text(1920 - 300, 300, "Input display does not currently support controllers.")
        } else {
            var leftPressed = false
            var rightPressed = false
            var upPressed = false
            var downPressed = false
            var skipVlPressed = false
            var resetPressed = false
            var menuPressed = false
            if(global.input_confirm_pressed){
                if(room == menu){
                    rightPressed = true
                } else {
                    upPressed = true
                }
            }
            if(global.input_jump_pressed){
                upPressed = true
            }
            if(global.input_jump){
                upPressed = true
            }
            if(global.input_x > 0){
                rightPressed = true
            }
            if(global.input_x < 0){
                leftPressed = true
            }
            if(global.input_x_pressed > 0){
                //rightPressed = true
            }
            if(global.input_x_pressed < 0){
                //leftPressed = true
            }
            if(global.input_down){
                downPressed = true
            }
            if(global.input_down_pressed){
                downPressed = true
            }
            if(global.inputaction_jump){
                //upPressed = true
            }
            if(global.inputaction_move_right){
                //rightPressed = true
            }
            if(global.inputaction_pause_menu){
                //menuPressed = true
            }
            if(global.inputaction_move_left){
                //leftPressed = true
            }
            if(global.inputaction_self_destruct){
                //resetPressed = true
            }
            //if(script_execute(variable_struct_get(global.inputaction_skip_voiceline, "GetDown"))){
                //skipVlPressed = true
            //}
            if(script_execute(variable_struct_get(global.inputaction_pause_menu, "GetDown"))){
                menuPressed = true
            }
            if(global.inputaction_navigate_down){
                //downPressed = true
            }
            if(global.inputaction_navigate_up){
                //upPressed = true
            }
            if(global.inputaction_navigate_confirm){
                //rightPressed = true
            }
            if(global.input_skipvoice_pressed){
                skipVlPressed = true
            }
            if(global.input_reset){
                resetPressed = true
            }

            if(upPressed){
                draw_sprite_ext(global.iDisplay_Up[1], 0, 1920 - 300, 120, 60 / sprite_get_width(global.iDisplay_Up[0]), 60 / sprite_get_width(global.iDisplay_Up[0]), 0, c_white, .75)
            } else {
                draw_sprite_ext(global.iDisplay_Up[0], 0, 1920 - 300, 120, 60 / sprite_get_width(global.iDisplay_Up[0]), 60 / sprite_get_width(global.iDisplay_Up[0]), 0, c_white, .75)
            }
            if(downPressed){
                draw_sprite_ext(global.iDisplay_Down[1], 0, 1920 - 300, 180, 60 / sprite_get_width(global.iDisplay_Down[0]), 60 / sprite_get_width(global.iDisplay_Down[0]), 0, c_white, .75)
            } else {
                draw_sprite_ext(global.iDisplay_Down[0], 0, 1920 - 300, 180, 60 / sprite_get_width(global.iDisplay_Down[0]), 60 / sprite_get_width(global.iDisplay_Down[0]), 0, c_white, .75)
            }
            if(leftPressed){
                draw_sprite_ext(global.iDisplay_Left[1], 0, 1920 - 360, 180, 60 / sprite_get_width(global.iDisplay_Left[0]), 60 / sprite_get_width(global.iDisplay_Left[0]), 0, c_white, .75)
            } else {
                draw_sprite_ext(global.iDisplay_Left[0], 0, 1920 - 360, 180, 60 / sprite_get_width(global.iDisplay_Left[0]), 60 / sprite_get_width(global.iDisplay_Left[0]), 0, c_white, .75)
            }
            if(rightPressed){
                draw_sprite_ext(global.iDisplay_Right[1], 0, 1920 - 240, 180, 60 / sprite_get_width(global.iDisplay_Right[0]), 60 / sprite_get_width(global.iDisplay_Right[0]), 0, c_white, .75)
            } else {
                draw_sprite_ext(global.iDisplay_Right[0], 0, 1920 - 240, 180, 60 / sprite_get_width(global.iDisplay_Right[0]), 60 / sprite_get_width(global.iDisplay_Right[0]), 0, c_white, .75)
            }
            if(skipVlPressed){
                draw_sprite_ext(global.iDisplay_Q[1], 0, 1920 - 140, 120, 60 / sprite_get_width(global.iDisplay_Q[0]), 60 / sprite_get_width(global.iDisplay_Q[0]), 0, c_white, .75)
            } else {
                draw_sprite_ext(global.iDisplay_Q[0], 0, 1920 - 140, 120, 60 / sprite_get_width(global.iDisplay_Q[0]), 60 / sprite_get_width(global.iDisplay_Q[0]), 0, c_white, .75)
            }
            if(resetPressed){
                draw_sprite_ext(global.iDisplay_R[1], 0, 1920 - 80, 120, 60 / sprite_get_width(global.iDisplay_R[0]), 60 / sprite_get_width(global.iDisplay_R[0]), 0, c_white, .75)
            } else {
                draw_sprite_ext(global.iDisplay_R[0], 0, 1920 - 80, 120, 60 / sprite_get_width(global.iDisplay_R[0]), 60 / sprite_get_width(global.iDisplay_R[0]), 0, c_white, .75)
            }
        }
    }
}



if(noclip_deathFX_fadeout > 0 && global.setting_noclip_indicator && global.invincible_mode){
    draw_set_color(global.setting_noclip_indicator_color)
    draw_set_alpha(noclip_deathFX_fadeout)
    draw_rectangle(0, 0, 3000, 3000, false)
    noclip_deathFX_fadeout -= noclip_fadeout_speed
    draw_set_color(c_white)
    draw_set_alpha(1)
} else {
    noclip_deathFX_fadeout = 0
}
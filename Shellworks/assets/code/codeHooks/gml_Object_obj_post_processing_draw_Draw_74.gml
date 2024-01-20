//Dear modders of my mod, Please forgive me for the horrible sins I have commited:
//Copying and pasting the same goddamn code like 50 times with slight changes instead of making a function
//I apologize for the pain you are about to go through modding this script :skull:




if(global.inspector_active){
    draw_set_color(c_gray)
    draw_rectangle(1, (1080 * .7) + 2, 1920 * .7, 1080 - 2, true)
    //draw_rectangle(1920 * .7 + 2, 2, 1920 - 2, 1080 - 2, true)
    display_set_gui_size(1920 / .7, 1080 / .7)
    time++
    if currently_reading_dialog_file
        time -= 0.9

    if (!application_surface_is_enabled())
        application_surface_enable(true)


        
    if (!surface_exists(application_surface))
        return false;
    
    if(global.rendering_enabled || room = menu){
        application_surface_draw_enable(false)
        gpu_set_texfilter(true)
        gpu_set_texrepeat(0)
        gpu_set_blendenable(false)
        blurRes = 0.25
        if (global.setting_post_processing >= 2)
        {
            if (!surface_exists(surface_blur_1))
                surface_blur_1 = surface_create((1920 * blurRes), (1080 * blurRes))
            if (!surface_exists(surface_blur_2))
                surface_blur_2 = surface_create((1920 * blurRes), (1080 * blurRes))
            if (!surface_exists(surface_combine))
                surface_combine = surface_create(1920, 1080)
            surface_set_target(surface_blur_1)
            draw_surface_stretched(application_surface, 0, 0, (1920 * blurRes), (1080 * blurRes))
            surface_reset_target()
            surface_set_target(surface_blur_2)
            shader_set(shd_blur_s)
            shader_set_uniform_f(u_fStepSizeX, 0.00325)
            shader_set_uniform_f(u_fStepSizeY, 0)
            draw_surface(surface_blur_1, 0, 0)
            shader_reset()
            surface_reset_target()
            surface_set_target(surface_blur_1)
            shader_set(shd_blur_s)
            shader_set_uniform_f(u_fStepSizeX, 0)
            shader_set_uniform_f(u_fStepSizeY, 0.0057777777777777775)
            draw_surface(surface_blur_2, 0, 0)
            shader_reset()
            surface_reset_target()
            if (global.setting_post_processing >= 3)
            {
                surface_set_target(surface_blur_2)
                shader_set(shd_blur_s)
                shader_set_uniform_f(u_fStepSizeX, 0.00075)
                shader_set_uniform_f(u_fStepSizeY, 0)
                draw_surface(surface_blur_1, 0, 0)
                shader_reset()
                surface_reset_target()
                surface_set_target(surface_blur_1)
                shader_set(shd_blur_s)
                shader_set_uniform_f(u_fStepSizeX, 0)
                shader_set_uniform_f(u_fStepSizeY, 0.0013333333333333333)
                draw_surface(surface_blur_2, 0, 0)
                shader_reset()
                surface_reset_target()
            }
            gpu_set_blendenable(true)
            surface_set_target(surface_combine)
            draw_clear(c_black)
            draw_surface(application_surface, 0, 0)
            if (global.setting_post_processing >= 2 && global.pp_bloom_strength > 0)
            {
                gpu_set_blendmode(bm_add)
                draw_surface_stretched_ext(surface_blur_1, 0, 0, 1920, 1080, global.pp_bloom_color, global.pp_bloom_strength)
                gpu_set_blendmode(bm_normal)
            }
            surface_reset_target()
        }
        gpu_set_alphatestenable(0)
        gpu_set_blendenable(false)
        gpu_set_texfilter(false)
        if (global.setting_post_processing >= 2)
        {
            brightness = 1
            drawsurface = surface_combine
        }
        else
        {
            brightness = (1 + (0.8 * global.pp_bloom_strength))
            drawsurface = application_surface
        }
        if global.underwater
        {
            shader_set(shd_pp_curve_underwater)
            shader_set_uniform_f(uniform_mid_undw, global.pp_curve_mid_r, global.pp_curve_mid_g, global.pp_curve_mid_b)
            shader_set_uniform_f(uniform_strength_undw, global.pp_curve_strength_r, global.pp_curve_strength_g, global.pp_curve_strength_b)
            shader_set_uniform_f(uniform_gradient_top_undw, global.pp_curve_ol_top_r, global.pp_curve_ol_top_g, global.pp_curve_ol_top_b)
            shader_set_uniform_f(uniform_gradient_bot_undw, global.pp_curve_ol_bot_r, global.pp_curve_ol_bot_g, global.pp_curve_ol_bot_b)
            shader_set_uniform_f(uniform_vignette_overlay_undw, global.pp_curve_vignette_r, global.pp_curve_vignette_g, global.pp_curve_vignette_b, global.pp_curve_vignette_a)
            shader_set_uniform_f(uniform_vignette_size_undw, global.pp_curve_vignette_size)
            shader_set_uniform_f(uniform_brightness_boost_underw, brightness)
            shader_set_uniform_f(uniform_time_undw, (time * 0.05))
            shader_set_uniform_f(uniform_wave_strength_undw, 0.002)
            if instance_exists(obj_levelstyler_underwater_glitchy)
            {
                shader_set_uniform_f(uniform_wave_strength_undw, 0.02)
                if global.save_pump_is_inverted
                    shader_set_uniform_f(uniform_wave_strength_undw, 0.005)
            }
            shader_set_uniform_f(uniform_wave_size_undw, 20)
            draw_surface_stretched(drawsurface, 0, 0, 1920, 1080)
            shader_reset()
        }
        else if obj_levelstyler.glitchy
        {
            shader_set(shd_pp_curve_glitchy)
            shader_set_uniform_f(uniform_mid_glitch, global.pp_curve_mid_r, global.pp_curve_mid_g, global.pp_curve_mid_b)
            shader_set_uniform_f(uniform_strength_glitch, global.pp_curve_strength_r, global.pp_curve_strength_g, global.pp_curve_strength_b)
            shader_set_uniform_f(uniform_gradient_top_glitch, global.pp_curve_ol_top_r, global.pp_curve_ol_top_g, global.pp_curve_ol_top_b)
            shader_set_uniform_f(uniform_gradient_bot_glitch, global.pp_curve_ol_bot_r, global.pp_curve_ol_bot_g, global.pp_curve_ol_bot_b)
            shader_set_uniform_f(uniform_vignette_overlay_glitch, global.pp_curve_vignette_r, global.pp_curve_vignette_g, global.pp_curve_vignette_b, global.pp_curve_vignette_a)
            shader_set_uniform_f(uniform_vignette_size_glitch, global.pp_curve_vignette_size)
            shader_set_uniform_f(uniform_glitchA_glitch, global.glitchA)
            shader_set_uniform_f(uniform_brightness_boost_glitch, brightness)
            draw_surface_stretched(drawsurface, 0, 0, 1920, 1080)
            shader_reset()
        }
        else
        {
            shader_set(shd_pp_curve)
            shader_set_uniform_f(uniform_mid, global.pp_curve_mid_r, global.pp_curve_mid_g, global.pp_curve_mid_b)
            shader_set_uniform_f(uniform_strength, global.pp_curve_strength_r, global.pp_curve_strength_g, global.pp_curve_strength_b)
            shader_set_uniform_f(uniform_gradient_top, global.pp_curve_ol_top_r, global.pp_curve_ol_top_g, global.pp_curve_ol_top_b)
            shader_set_uniform_f(uniform_gradient_bot, global.pp_curve_ol_bot_r, global.pp_curve_ol_bot_g, global.pp_curve_ol_bot_b)
            shader_set_uniform_f(uniform_vignette_overlay, global.pp_curve_vignette_r, global.pp_curve_vignette_g, global.pp_curve_vignette_b, global.pp_curve_vignette_a)
            shader_set_uniform_f(uniform_vignette_size, global.pp_curve_vignette_size)
            shader_set_uniform_f(uniform_brightness_boost, brightness)
            draw_surface_stretched(drawsurface, 0, 0, 1920, 1080)
            shader_reset()
        }
        gpu_set_blendenable(true)


        display_set_gui_size(1920, 1080)

        draw_set_alpha(1)
        var y_offset = 0
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        thisInst = global.inspector_selected_obj
        //show_message(string(thisInst))
        if(instance_exists(thisInst)){
            if(!variable_instance_exists(id, "curTyping")){
                curTyping = ""
            }
            if(!variable_instance_exists(id, "typingIn")){
                typingIn = ""
            }
            if(!variable_instance_exists(id, "typingLineThingyTimer")){
                typingLineThingyTimer = 0
            }

            thisKey = "xPosition"
            draw_set_font(global.font_aiTalk)
            draw_set_color(c_dkgray)
            draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, false)
            draw_set_halign(fa_left)
            draw_set_color(c_white)
            draw_set_valign(fa_bottom)
            draw_text_ext((1920 * .71), 60 + y_offset + global.debugger_scroll, thisKey, 1, 10000)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            if(typingIn == thisKey){
                if(typingLineThingyTimer >= 30)
                    scr_draw_text_in_box(string(curTyping) + "|", (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
                else
                    scr_draw_text_in_box(string(curTyping), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
            } else {
                    scr_draw_text_in_box(string(thisInst.x), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
            }
            if(typingIn == thisKey)
                draw_set_color(c_white)
            else
                draw_set_color(c_black)
            draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, true)
            if(typingIn == thisKey){ 

                typingLineThingyTimer += 1
                if(typingLineThingyTimer > 60){
                    typingLineThingyTimer = 0
                }

                global.editor_input_disabled = true
                if(string_length(keyboard_string) > 0){
                    curTyping = string(curTyping) + keyboard_string
                    keyboard_string = ""
                }

                if(keyboard_check_pressed(vk_backspace)){
                    if(string_length(curTyping) > 0)
                        curTyping = string_delete(curTyping, string_length(curTyping), 1)
                }
                    
                if(global.input_virtualmouse_lbutton_pressed || keyboard_check_pressed(vk_enter)){
                    answer = curTyping
                    string_digits_answer = ""
                    accepted_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "-"]
                    accepted_num_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                    var has_num_char = false
                    for(var c = 1; c <= string_length(answer); c++){
                        var is_in_array = false
                        for(var c2 = 1; c2 <= array_length(accepted_chars); c2++){
                            if(string_char_at(answer, c) == accepted_chars[c2-1]){
                                is_in_array = true 
                            }
                        }
                        for(var c2 = 1; c2 <= array_length(accepted_num_chars); c2++){
                            if(string_char_at(answer, c) == accepted_num_chars[c2-1]){
                                has_num_char = true 
                            }
                        }
                        if(is_in_array){
                            string_digits_answer += string_char_at(answer, c)
                        }
                    }

                    is_acceptable_num = true
                    var strPos = string_pos("-", string_digits_answer)
                    if((strPos > 1) || string_count("-", is_acceptable_num) > 1 || string_count(".", is_acceptable_num) > 1){
                        is_acceptable_num = false
                    }

                    if(string_digits_answer != "" && has_num_char && is_acceptable_num){
                        thisInst.x = real(string_digits_answer)
                    }
                    typingIn = ""
                    global.editor_input_disabled = false
                }
            } else {
                if(global.input_virtualmouse_lbutton_pressed){
                    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll)){
                        typingLineThingyTimer = 0
                        typingIn = thisKey
                        typingLineThingyTimer = 30
                        keyboard_string = ""
                        curTyping = string(thisInst.x)
                    }
                }
            }
            y_offset += 130






            thisKey = "yPosition"
            draw_set_font(global.font_aiTalk)
            draw_set_color(c_dkgray)
            draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, false)
            draw_set_halign(fa_left)
            draw_set_color(c_white)
            draw_set_valign(fa_bottom)
            draw_text_ext((1920 * .71), 60 + y_offset + global.debugger_scroll, thisKey, 1, 10000)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            if(typingIn == thisKey){
                if(typingLineThingyTimer >= 30)
                    scr_draw_text_in_box(string(curTyping) + "|", (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
                else
                    scr_draw_text_in_box(string(curTyping), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
            } else {
                    scr_draw_text_in_box(string(thisInst.y), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
            }
            if(typingIn == thisKey)
                draw_set_color(c_white)
            else
                draw_set_color(c_black)
            draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, true)
            if(typingIn == thisKey){ 

                typingLineThingyTimer += 1
                if(typingLineThingyTimer > 60){
                    typingLineThingyTimer = 0
                }

                global.editor_input_disabled = true
                if(string_length(keyboard_string) > 0){
                    curTyping = string(curTyping) + keyboard_string
                    keyboard_string = ""
                }

                if(keyboard_check_pressed(vk_backspace)){
                    if(string_length(curTyping) > 0)
                        curTyping = string_delete(curTyping, string_length(curTyping), 1)
                }
                    
                if(global.input_virtualmouse_lbutton_pressed || keyboard_check_pressed(vk_enter)){
                    answer = curTyping
                    string_digits_answer = ""
                    accepted_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "-"]
                    accepted_num_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                    var has_num_char = false
                    for(var c = 1; c <= string_length(answer); c++){
                        var is_in_array = false
                        for(var c2 = 1; c2 <= array_length(accepted_chars); c2++){
                            if(string_char_at(answer, c) == accepted_chars[c2-1]){
                                is_in_array = true 
                            }
                        }
                        for(var c2 = 1; c2 <= array_length(accepted_num_chars); c2++){
                            if(string_char_at(answer, c) == accepted_num_chars[c2-1]){
                                has_num_char = true 
                            }
                        }
                        if(is_in_array){
                            string_digits_answer += string_char_at(answer, c)
                        }
                    }

                    is_acceptable_num = true
                    var strPos = string_pos("-", string_digits_answer)
                    if((strPos > 1) || string_count("-", is_acceptable_num) > 1 || string_count(".", is_acceptable_num) > 1){
                        is_acceptable_num = false
                    }

                    if(string_digits_answer != "" && has_num_char && is_acceptable_num){
                        thisInst.y = real(string_digits_answer)
                    }
                    typingIn = ""
                    global.editor_input_disabled = false
                }
            } else {
                if(global.input_virtualmouse_lbutton_pressed){
                    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll)){
                        typingLineThingyTimer = 0
                        typingIn = thisKey
                        typingLineThingyTimer = 30
                        keyboard_string = ""
                        curTyping = string(thisInst.y)
                    }
                }
            }
            y_offset += 130



            thisKey = "xScale"
            draw_set_font(global.font_aiTalk)
            draw_set_color(c_dkgray)
            draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, false)
            draw_set_halign(fa_left)
            draw_set_color(c_white)
            draw_set_valign(fa_bottom)
            draw_text_ext((1920 * .71), 60 + y_offset + global.debugger_scroll, thisKey, 1, 10000)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            if(typingIn == thisKey){
                if(typingLineThingyTimer >= 30)
                    scr_draw_text_in_box(string(curTyping) + "|", (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
                else
                    scr_draw_text_in_box(string(curTyping), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
            } else {
                    scr_draw_text_in_box(string(thisInst.image_xscale), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
            }
            if(typingIn == thisKey)
                draw_set_color(c_white)
            else
                draw_set_color(c_black)
            draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, true)
            if(typingIn == thisKey){ 

                typingLineThingyTimer += 1
                if(typingLineThingyTimer > 60){
                    typingLineThingyTimer = 0
                }

                global.editor_input_disabled = true
                if(string_length(keyboard_string) > 0){
                    curTyping = string(curTyping) + keyboard_string
                    keyboard_string = ""
                }

                if(keyboard_check_pressed(vk_backspace)){
                    if(string_length(curTyping) > 0)
                        curTyping = string_delete(curTyping, string_length(curTyping), 1)
                }
                    
                if(global.input_virtualmouse_lbutton_pressed || keyboard_check_pressed(vk_enter)){
                    answer = curTyping
                    string_digits_answer = ""
                    accepted_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "-"]
                    accepted_num_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                    var has_num_char = false
                    for(var c = 1; c <= string_length(answer); c++){
                        var is_in_array = false
                        for(var c2 = 1; c2 <= array_length(accepted_chars); c2++){
                            if(string_char_at(answer, c) == accepted_chars[c2-1]){
                                is_in_array = true 
                            }
                        }
                        for(var c2 = 1; c2 <= array_length(accepted_num_chars); c2++){
                            if(string_char_at(answer, c) == accepted_num_chars[c2-1]){
                                has_num_char = true 
                            }
                        }
                        if(is_in_array){
                            string_digits_answer += string_char_at(answer, c)
                        }
                    }

                    is_acceptable_num = true
                    var strPos = string_pos("-", string_digits_answer)
                    if((strPos > 1) || string_count("-", is_acceptable_num) > 1 || string_count(".", is_acceptable_num) > 1){
                        is_acceptable_num = false
                    }

                    if(string_digits_answer != "" && has_num_char && is_acceptable_num){
                        thisInst.image_xscale = real(string_digits_answer)
                    }
                    typingIn = ""
                    global.editor_input_disabled = false
                }
            } else {
                if(global.input_virtualmouse_lbutton_pressed){
                    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll)){
                        typingLineThingyTimer = 0
                        typingIn = thisKey
                        typingLineThingyTimer = 30
                        keyboard_string = ""
                        curTyping = string(thisInst.image_xscale)
                    }
                }
            }
            y_offset += 130






            thisKey = "yScale"
            draw_set_font(global.font_aiTalk)
            draw_set_color(c_dkgray)
            draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, false)
            draw_set_halign(fa_left)
            draw_set_color(c_white)
            draw_set_valign(fa_bottom)
            draw_text_ext((1920 * .71), 60 + y_offset + global.debugger_scroll, thisKey, 1, 10000)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            if(typingIn == thisKey){
                if(typingLineThingyTimer >= 30)
                    scr_draw_text_in_box(string(curTyping) + "|", (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
                else
                    scr_draw_text_in_box(string(curTyping), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
            } else {
                    scr_draw_text_in_box(string(thisInst.image_yscale), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
            }
            if(typingIn == thisKey)
                draw_set_color(c_white)
            else
                draw_set_color(c_black)
            draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, true)
            if(typingIn == thisKey){ 

                typingLineThingyTimer += 1
                if(typingLineThingyTimer > 60){
                    typingLineThingyTimer = 0
                }

                global.editor_input_disabled = true
                if(string_length(keyboard_string) > 0){
                    curTyping = string(curTyping) + keyboard_string
                    keyboard_string = ""
                }

                if(keyboard_check_pressed(vk_backspace)){
                    if(string_length(curTyping) > 0)
                        curTyping = string_delete(curTyping, string_length(curTyping), 1)
                }
                    
                if(global.input_virtualmouse_lbutton_pressed || keyboard_check_pressed(vk_enter)){
                    answer = curTyping
                    string_digits_answer = ""
                    accepted_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "-"]
                    accepted_num_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                    var has_num_char = false
                    for(var c = 1; c <= string_length(answer); c++){
                        var is_in_array = false
                        for(var c2 = 1; c2 <= array_length(accepted_chars); c2++){
                            if(string_char_at(answer, c) == accepted_chars[c2-1]){
                                is_in_array = true 
                            }
                        }
                        for(var c2 = 1; c2 <= array_length(accepted_num_chars); c2++){
                            if(string_char_at(answer, c) == accepted_num_chars[c2-1]){
                                has_num_char = true 
                            }
                        }
                        if(is_in_array){
                            string_digits_answer += string_char_at(answer, c)
                        }
                    }

                    is_acceptable_num = true
                    var strPos = string_pos("-", string_digits_answer)
                    if((strPos > 1) || string_count("-", is_acceptable_num) > 1 || string_count(".", is_acceptable_num) > 1){
                        is_acceptable_num = false
                    }

                    if(string_digits_answer != "" && has_num_char && is_acceptable_num){
                        thisInst.image_yscale = real(string_digits_answer)
                    }
                    typingIn = ""
                    global.editor_input_disabled = false
                }
            } else {
                if(global.input_virtualmouse_lbutton_pressed){
                    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll)){
                        typingLineThingyTimer = 0
                        typingIn = thisKey
                        typingLineThingyTimer = 30
                        keyboard_string = ""
                        curTyping = string(thisInst.image_yscale)
                    }
                }
            }
            y_offset += 130






            thisKey = "rotation"
            draw_set_font(global.font_aiTalk)
            draw_set_color(c_dkgray)
            draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, false)
            draw_set_halign(fa_left)
            draw_set_color(c_white)
            draw_set_valign(fa_bottom)
            draw_text_ext((1920 * .71), 60 + y_offset + global.debugger_scroll, thisKey, 1, 10000)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            if(typingIn == thisKey){
                if(typingLineThingyTimer >= 30)
                    scr_draw_text_in_box(string(curTyping) + "|", (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
                else
                    scr_draw_text_in_box(string(curTyping), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
            } else {
                    scr_draw_text_in_box(string(thisInst.image_angle), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
            }
            if(typingIn == thisKey)
                draw_set_color(c_white)
            else
                draw_set_color(c_black)
            draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, true)
            if(typingIn == thisKey){ 

                typingLineThingyTimer += 1
                if(typingLineThingyTimer > 60){
                    typingLineThingyTimer = 0
                }

                global.editor_input_disabled = true
                if(string_length(keyboard_string) > 0){
                    curTyping = string(curTyping) + keyboard_string
                    keyboard_string = ""
                }

                if(keyboard_check_pressed(vk_backspace)){
                    if(string_length(curTyping) > 0)
                        curTyping = string_delete(curTyping, string_length(curTyping), 1)
                }
                    
                if(global.input_virtualmouse_lbutton_pressed || keyboard_check_pressed(vk_enter)){
                    answer = curTyping
                    string_digits_answer = ""
                    accepted_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "-"]
                    accepted_num_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                    var has_num_char = false
                    for(var c = 1; c <= string_length(answer); c++){
                        var is_in_array = false
                        for(var c2 = 1; c2 <= array_length(accepted_chars); c2++){
                            if(string_char_at(answer, c) == accepted_chars[c2-1]){
                                is_in_array = true 
                            }
                        }
                        for(var c2 = 1; c2 <= array_length(accepted_num_chars); c2++){
                            if(string_char_at(answer, c) == accepted_num_chars[c2-1]){
                                has_num_char = true 
                            }
                        }
                        if(is_in_array){
                            string_digits_answer += string_char_at(answer, c)
                        }
                    }

                    is_acceptable_num = true
                    var strPos = string_pos("-", string_digits_answer)
                    if((strPos > 1) || string_count("-", is_acceptable_num) > 1 || string_count(".", is_acceptable_num) > 1){
                        is_acceptable_num = false
                    }

                    if(string_digits_answer != "" && has_num_char && is_acceptable_num){
                        thisInst.image_angle = real(string_digits_answer)
                    }
                    typingIn = ""
                    global.editor_input_disabled = false
                }
            } else {
                if(global.input_virtualmouse_lbutton_pressed){
                    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll)){
                        typingLineThingyTimer = 0
                        typingIn = thisKey
                        typingLineThingyTimer = 30
                        keyboard_string = ""
                        curTyping = string(thisInst.image_angle)
                    }
                }
            }
            y_offset += 130






            if(variable_instance_exists(thisInst, "map_properties")){
                thisKey = ds_map_find_first(thisInst.map_properties)
                for (pri = 0; pri < ds_map_size(thisInst.map_properties); pri++)
                {
                    draw_set_font(global.font_aiTalk)
                    draw_set_color(c_dkgray)
                    draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, false)
                    draw_set_halign(fa_left)
                    draw_set_color(c_white)
                    draw_set_valign(fa_bottom)
                    draw_text_ext((1920 * .71), 60 + y_offset + global.debugger_scroll, thisKey, 1, 10000)
                    draw_set_halign(fa_left)
                    draw_set_valign(fa_top)
                    if(typingIn == thisKey){
                        if(typingLineThingyTimer >= 30)
                            scr_draw_text_in_box(string(curTyping) + "|", (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
                        else
                            scr_draw_text_in_box(string(curTyping), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
                    } else {
                            scr_draw_text_in_box(string(ds_map_find_value(thisInst.map_properties, thisKey)), (1920 * .2), 75, 1, -1, (1920 * .71) + 5, 85 + y_offset + global.debugger_scroll, false)
                    }
                    if(typingIn == thisKey)
                        draw_set_color(c_white)
                    else
                        draw_set_color(c_black)
                    draw_rectangle((1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll, true)
                    if(typingIn == thisKey){ 

                        typingLineThingyTimer += 1
                        if(typingLineThingyTimer > 60){
                            typingLineThingyTimer = 0
                        }

                        global.editor_input_disabled = true
                        if(string_length(keyboard_string) > 0){
                            curTyping = string(curTyping) + keyboard_string
                            keyboard_string = ""
                        }

                        if(keyboard_check_pressed(vk_backspace)){
                            if(string_length(curTyping) > 0)
                                curTyping = string_delete(curTyping, string_length(curTyping), 1)
                        }
                            
                        if(global.input_virtualmouse_lbutton_pressed || keyboard_check_pressed(vk_enter)){
                            answer = curTyping
                            string_digits_answer = ""
                            accepted_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "-"]
                            accepted_num_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                            var has_num_char = false
                            for(var c = 1; c <= string_length(answer); c++){
                                var is_in_array = false
                                for(var c2 = 1; c2 <= array_length(accepted_chars); c2++){
                                    if(string_char_at(answer, c) == accepted_chars[c2-1]){
                                        is_in_array = true 
                                    }
                                }
                                for(var c2 = 1; c2 <= array_length(accepted_num_chars); c2++){
                                    if(string_char_at(answer, c) == accepted_num_chars[c2-1]){
                                        has_num_char = true 
                                    }
                                }
                                if(is_in_array){
                                    string_digits_answer += string_char_at(answer, c)
                                }
                            }

                            is_acceptable_num = true
                            var strPos = string_pos("-", string_digits_answer)
                            if((strPos > 1) || string_count("-", is_acceptable_num) > 1 || string_count(".", is_acceptable_num) > 1){
                                is_acceptable_num = false
                            }

                            if(string_digits_answer != "" && has_num_char && is_acceptable_num){
                                ds_map_set(thisInst.map_properties, thisKey, real(string_digits_answer))
                            }
                            typingIn = ""
                            global.editor_input_disabled = false
                        }
                    } else {
                        if(global.input_virtualmouse_lbutton_pressed){
                            if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (1920 * .7), 80 + y_offset + global.debugger_scroll, 1900, 140 + y_offset + global.debugger_scroll)){
                                typingLineThingyTimer = 0
                                typingIn = thisKey
                                typingLineThingyTimer = 30
                                keyboard_string = ""
                                curTyping = string(ds_map_find_value(thisInst.map_properties, thisKey))
                            }
                        }
                    }
                    thisKey = ds_map_find_next(thisInst.map_properties, thisKey)
                    y_offset += 130
                }
            }
        }


        var scroll_speed = 10
        if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1920 * .7 + 2, 2, 1920 - 2, 1080 - 2)){
            if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1920 * .7 + 2, 1080 - 250, 1920 - 2, 1080 - 2)){
                global.debugger_scroll -= scroll_speed
            }
            if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1920 * .7 + 2, 2, 1920 - 2, 250)){
                global.debugger_scroll += scroll_speed
            }
        }

        if(global.debugger_scroll > 800){
            global.debugger_scroll = 800
        }
        if(global.debugger_scroll < -y_offset){
            global.debugger_scroll = -y_offset
        }


        draw_set_alpha(1)
        display_set_gui_size(1920 / .7, 1080 / .7)
    } else {
        draw_set_color(c_black)
        draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), false)
        draw_set_font(global.font_aiTalk)
        draw_set_halign(fa_middle)
        draw_set_valign(fa_center)
        draw_set_color(c_dkgray)
        draw_text(camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) / 2, "RENDERING DISABLED")
    }
} else if(global.global_inspector_active && room != level_editor && room != menu && room != main_menu_dark && room != disclaimer_photoepilepsy) {
    gml_Script_scr_draw_global_inspector_UI()
} else {
    display_set_gui_size(1920, 1080)
    
    if(global.rendering_enabled || room = menu){
        #orig#()
    } else {
        draw_set_color(c_black)
        draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), false)
        draw_set_font(global.font_aiTalk)
        draw_set_halign(fa_middle)
        draw_set_valign(fa_center)
        draw_set_color(c_dkgray)
        draw_text(camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) / 2, "RENDERING DISABLED")
    }
}
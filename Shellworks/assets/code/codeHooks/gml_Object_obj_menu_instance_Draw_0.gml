if destroyed
{
    return false;
}
time++
target_aalpha = 0
if (child_menu != self)
{
    if instance_exists(child_menu)
    {
        if (child_menu.child_menu != self)
        {
            if instance_exists(child_menu.child_menu)
                target_aalpha = 1
        }
    }
}
aalpha = lerp(aalpha, target_aalpha, 0.1)
cooldown--
menuItemCount = ds_list_size(liMenuItemInstances)
if (frozen == 0 && cooldown <= 0)
{
    global.menu_offset_target = 80
    if (parent_menu != self)
    {
        if instance_exists(parent_menu)
            global.menu_offset_target -= parent_menu.startx
    }
    performed_an_input_action = 0
    if global.input_down_pressed
    {
        if (!obj_menu_manager.menu_not_interactable_or_quittable)
        {
            if (!performed_an_input_action)
            {
                performed_an_input_action = 1
                selectedItem++
                if (selectedItem > (menuItemCount - 1))
                {
                    if bAllowLoopingUpDown
                        selectedItem = 0
                    else
                        selectedItem = (menuItemCount - 1)
                }
                if bEnableUISounds
                {
                    sound = audio_play_sound(sou_click, 1, false)
                    audio_sound_gain_fx(sound, 1, 0)
                }
                if bExecuteScriptsOnSwitch
                    scr_menu_instance_execute_script()
            }
        }
    }
    if global.input_jump_pressed
    {
        if (!obj_menu_manager.menu_not_interactable_or_quittable)
        {
            if (!performed_an_input_action)
            {
                performed_an_input_action = 1
                selectedItem--
                if (selectedItem < 0)
                {
                    if bAllowLoopingUpDown
                        selectedItem = (menuItemCount - 1)
                    else
                        selectedItem = 0
                }
                if bEnableUISounds
                {
                    sound = audio_play_sound(sou_click, 1, false)
                    audio_sound_gain_fx(sound, 1, 0)
                }
                if bExecuteScriptsOnSwitch
                    scr_menu_instance_execute_script()
            }
        }
    }
    if (global.input_x_pressed == 1 || global.input_confirm_pressed)
    {
        if (!obj_menu_manager.menu_not_interactable_or_quittable)
        {
            if (!performed_an_input_action)
            {
                performed_an_input_action = 1
                if bEnableUISounds
                {
                    sound = audio_play_sound(sou_click, 1, false)
                    audio_sound_gain_fx(sound, 1, 0)
                    audio_sound_pitch(sound, 1.5)
                }
                if bExecuteScriptsOnConfirm
                    scr_menu_instance_execute_script()
                if destroyed
                {
                    return false;
                }
                if bExitSumbenuAfterConfirm
                    scr_exit_submenu()
                if destroyed
                {
                    return false;
                }
                submenu = ds_list_find_value(liMenuItemInstances, selectedItem)
                if (submenu >= 0)
                {
                    frozen = 1
                    created_submenu = instance_create_layer(0, 0, layer, submenu)
                    created_submenu.parent_menu = id
                    created_submenu.startx = (startx + xspacing)
                    child_menu = created_submenu
                }
            }
        }
    }
    if (global.input_x_pressed == -1)
    {
        if (!obj_menu_manager.menu_not_interactable_or_quittable)
        {
            if (parent_menu >= 0)
            {
                if (!performed_an_input_action)
                {
                    performed_an_input_action = 1
                    if bExecuteScriptsOnExit
                    {
                        sound = audio_play_sound(sou_click, 1, false)
                        audio_sound_gain_fx(sound, 1, 0)
                        audio_sound_pitch(sound, 1.5)
                        scr_menu_instance_execute_script()
                    }
                    scr_exit_submenu()
                    return false;
                }
            }
        }
    }
}
if(string_pos("colormenu_", object_get_name(object_index)) != 0){
    yspacing = 50
}
if(string_pos("obj_menu_wysapi_player_character", object_get_name(object_index)) != 0){
    yspacing = 75
}
if(object_get_name(object_index) == "obj_menu_wysapi_level_editor" || object_get_name(object_index) == "obj_menu_Controls"){
    yspacing = 75
}
starty = ((room_height - ((menuItemCount - 1) * yspacing)) / 2)
draw_set_font(global.font_aiTalk)
if(global.rendering_enabled){
    draw_set_color(c_white)
} else {
    draw_set_color(c_dkgray)
}
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
for (i = 0; i < menuItemCount; i++)
{
    if (frozen || tooltip_selected)
        draw_set_color(c_dkgray)
    stringOrImage = ds_list_find_value(liMenuItemNames, i)
    ypos = ((i * yspacing) + starty)
    if is_string(stringOrImage)
    {
        txt_width = string_width(stringOrImage)
        txt_scale = (maxwidth_per_section / max(txt_width, maxwidth_per_section))
        txt_width *= txt_scale
        draw_text_transformed(((startx + global.menu_offset) - (aalpha * 20)), ypos, stringOrImage, txt_scale, txt_scale, 0)
    }
    else if sprite_exists(stringOrImage)
        draw_sprite(stringOrImage, 0, ((startx + global.menu_offset) - (aalpha * 20)), ypos)
    if (selectedItem == i)
    {
        if is_string(stringOrImage)
        {
            draw_rectangle(((startx + global.menu_offset) - (aalpha * 20)), (ypos + 25), (((startx + global.menu_offset) + txt_width) - (aalpha * 20)), (ypos + 30), false)
            if (frozen == 0)
            {
                if (ds_list_find_value(liMenuItemInstances, i) != -1)
                    draw_sprite(spr_menu_expand, 0, (((((startx + global.menu_offset) + txt_width) - (aalpha * 20)) + 13) + (sin((time * 0.2)) * 4)), ypos)
            }
        }
        if tooltip_selected
        if(global.rendering_enabled){
            draw_set_color(c_white)
        } else {
            draw_set_color(c_dkgray)
        }
        if (frozen == 0)
        {
            if (tooltip_cooldown <= 0)
            {
                tooltip_text = ""
                script = ds_list_find_value(liMenuItemTooltipScript, selectedItem)
                if (script >= scr_editor_mod_helpers)
                {
                    scriptArgument = ds_list_find_value(liMenuItemTooltipArgument, selectedItem)
                    if (scriptArgument != -1)
                        tooltip_text = script_execute(script, scriptArgument)
                    else
                        tooltip_text = script_execute(script)
                }
                tooltip_w = ((1920 - ((startx + xspacing) + global.menu_offset_target)) - 70)
                if is_string(tooltip_text)
                {
                    true_tooltip_width = arab_string_width_ext(tooltip_text, -1, tooltip_w)
                    tooltip_scale = (tooltip_w / max(true_tooltip_width, tooltip_w))
                    arab_draw_text_ext_transformed(((startx + global.menu_offset) + xspacing), (room_height / 2), tooltip_text, 55, tooltip_w, tooltip_scale, tooltip_scale, 0)
                    if tooltip_selected
                        scr_draw_rectangle_border_fromto((((startx + global.menu_offset) + xspacing) - 40), 20, (room_width - 20), (room_height - 20), 4, 16777215)
                }
                else if is_numeric(tooltip_text)
                {
                    if sprite_exists(tooltip_text)
                        draw_sprite(tooltip_text, 0, ((startx + global.menu_offset) + xspacing), (room_height / 2))
                }
            }
            tooltip_cooldown--
        }
        else
            tooltip_cooldown = 2
    }
}

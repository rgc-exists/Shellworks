#orig#()

if(global.setting_optimized_wires){
    if (!variable_global_exists("powered_count"))
        global.powered_count = 0
    else if (global.powered_count > 0)
    {
        var li_powered = ds_list_create()
        with (obj_powerable_parent)
        {
            if power_generator
                ds_list_add(li_powered, id)
            powered = 0
        }
        for (i = 0; i < ds_list_size(li_powered); i++)
        {
            powered_obj = ds_list_find_value(li_powered, i)
            if ((powered_obj.power_may_flow_through || powered_obj.power_generator) && (!scr_is_corrupted(powered_obj)))
            {
                for (var c = 0; c < ds_list_size(powered_obj.li_power_connections); c += 1)
                {
                    connection = ds_list_find_value(powered_obj.li_power_connections, c)
                    if (connection.accept_external_power || connection.power_generator)
                    {
                        if (!connection.powered)
                        {
                            connection.powered = 1
                            ds_list_add(li_powered, connection)
                        }
                    }
                }
            }
        }
        ds_list_destroy(li_powered)
    }
    global.powered_count = 0
}

if(room != menu && room != level_editor && room != main_menu_dark && room != disclaimer_photoepilepsy){
    if(global.setting_global_inspector_available){
        if(keyboard_check_pressed(vk_f5)){
            global.global_inspector_active = !global.global_inspector_active
        }
    }
} else if(room == level_editor){
    global.global_inspector_active = false
    global.global_inspector_selected_obj = -500
    ds_list_clear(global.recently_selected_objs)
}

if(global.global_inspector_active){
    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 2, 2, 1920 - 2, 1080 - 2)){
        if(mouse_check_button_pressed(mb_left)){
            var li_selected_objs = ds_list_create()


            //https://forum.gamemaker.io/index.php?threads/convert-gui-coordinates-to-real-position-in-the-level.97115/
            var _gui_x_normalised = device_mouse_x_to_gui(0) / (display_get_gui_width() * .7);
            var _gui_y_normalised = device_mouse_y_to_gui(0) / (display_get_gui_height() * .7);
            var _camera_x = _gui_x_normalised * camera_get_view_width(view_camera[0]);
            var _camera_y = _gui_y_normalised * camera_get_view_height(view_camera[0]);
            room_msxpos = camera_get_view_x(view_camera[0]) + _camera_x;
            room_msypos = camera_get_view_y(view_camera[0]) + _camera_y;



            collision_point_list(room_msxpos, room_msypos, all, true, true, li_selected_objs, false)

            for(var so = 0; so < ds_list_size(li_selected_objs); so++){
                var curSelectedObj = ds_list_find_value(li_selected_objs, so)
                for(var o = 0; o < ds_list_size(global.recently_selected_objs); o++){
                    var curRecentObj = ds_list_find_value(global.recently_selected_objs, o)
                    if(instance_exists(curRecentObj)){
                        if(!point_in_rectangle(room_msxpos, room_msypos, curRecentObj.bbox_left, curRecentObj.bbox_top, curRecentObj.bbox_right, curRecentObj.bbox_bottom)){
                            ds_list_delete(global.recently_selected_objs, o)
                        }
                    } else {
                        ds_list_delete(global.recently_selected_objs, o)
                    }
                }
                if(ds_list_find_index(global.recently_selected_objs, curSelectedObj) != -1){
                    continue;
                } else {
                    global.global_inspector_selected_obj = curSelectedObj
                    ds_list_add(global.recently_selected_objs, curSelectedObj)
                    while(ds_list_size(global.recently_selected_objs) > ds_list_size(li_selected_objs)){
                        ds_list_delete(global.recently_selected_objs, 0)
                    }
                    break;
                }
            }

            ds_list_destroy(li_selected_objs)
        }
    }
}

if(!instance_exists(obj_player) && room != menu && !instance_exists(obj_level_transition)){
    global.save_speedrun_timer_attempt = 0
}

if(instance_exists(obj_player)){
    if(obj_player.dead >= 0){
        if (global.save_speedrun_timer_game > 0)
        {
            global.save_speedrun_timer_attempt -= (delta_time / 1000000)
            global.save_speedrun_timer_attempt += (1 / room_speed)
            global.save_speedrun_timer_attempt = max(0, global.save_speedrun_timer_attempt)
        }
    }
}


gml_Script_scr_check_if_speedrun_legit()


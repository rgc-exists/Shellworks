
switch argument1
{
    case 0:
        collision = gml_Script_hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, obj_lvlobj_parent)
        if (collision != noone)
        {
            if(instance_exists(collision)){
                hlp_draw_bounding_box_around_obj(collision, 4, c_aqua)
            }
        }
        break
    case 1:
        var should_continue = true
        if(variable_instance_exists(id, "inspector_select_cooldown")){
            if(inspector_select_cooldown > 0){
                should_continue = false
            }
        }
        if(device_mouse_x_to_gui(0) > 1920 || device_mouse_y_to_gui(0) > 1080){
            should_continue = false
        }
        if(should_continue){
            collision = gml_Script_hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, obj_lvlobj_parent)
            if (collision != noone)
            {
                if(instance_exists(collision)){
                    hlp_draw_bounding_box_around_obj(collision, 4, c_aqua)
                    typingIn = ""
                    global.inspector_selected_obj = collision
                    global.inspector_active = true
                    global.debugger_scroll = 50
                    global.debugger_scroll_speed = 40
                    global.object_search_selected = false
                    global.object_search_query = ""
                    global.inspector_selection = []
                    inspector_select_cooldown = 60
                }
            }
        }
        break
    case 4:
        collision = gml_Script_hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, obj_lvlobj_parent)
        if (collision != noone)
        {
            if(instance_exists(collision)){
                hlp_draw_bounding_box_around_obj(collision, 4, c_aqua)
            }
        }
        break
    case 2:
        break
}

return 1;


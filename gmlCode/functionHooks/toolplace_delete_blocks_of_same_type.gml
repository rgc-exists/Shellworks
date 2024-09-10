if(keyboard_check(ord("X"))){
    return toolplace_delete_blocks_all_in_rect(argument0, argument1)
} else {
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_traps, sou_iron_hit_a, 0.7, 0.05)
            break
        case 2:
            mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
            mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
            mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
            mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
            xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
            if is_undefined(xoffseet)
                xoffseet = 0
            else
                xoffseet = xoffseet.value
            yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
            if is_undefined(yoffseet)
                yoffseet = 0
            else
                yoffseet = yoffseet.value
            li_objects_in_box = ds_list_create()
            collision_rectangle_list(((mouse_drag_box_xmin + 2) + xoffseet), ((mouse_drag_box_ymin + 2) + yoffseet), ((mouse_drag_box_xmax - 2) + xoffseet), ((mouse_drag_box_ymax - 2) + yoffseet), argument0.object_index_in_editor, 1, 1, li_objects_in_box, 0)
            deleted_at_least_one_obj = 0
            tool_id = argument0.custom_tool_or_object_id
            for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
            {
                inst_check = ds_list_find_value(li_objects_in_box, indx)
                if (variable_struct_get(inst_check.toolStruct, "custom_tool_or_object_id") != variable_struct_get(argument0, "custom_tool_or_object_id"))
                {
                }
                else
                {
                    deleted_at_least_one_obj = 1
                    if (inst_check.is_wall_like && inst_check.is_wall)
                        hlp_destoy_wall_block_full_or_partially(inst_check, mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
                    else
                        instance_destroy(inst_check)
                }
            }
            if deleted_at_least_one_obj
            {
                sound = audio_play_sound(sou_shooter_explosion_03, 0.95, false)
                audio_sound_gain(sound, 0.5, 0)
                audio_sound_pitch(sound, (1 + random(0.4)))
            }
            ds_list_destroy(li_objects_in_box)
            if (collision_rectangle((mouse_drag_box_xmin + 2), (level_bound_y1 - 100), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x2 = min(max((level_bound_x1 + 1920), mouse_drag_box_xmin), level_bound_x2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (mouse_drag_box_xmax - 2), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x1 = max(min((level_bound_x2 - 1920), mouse_drag_box_xmax), level_bound_x1)
            if (collision_rectangle((level_bound_x1 - 100), (mouse_drag_box_ymin + 2), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y2 = min(max((level_bound_y1 + 1080), mouse_drag_box_ymin), level_bound_y2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (level_bound_x2 + 100), (mouse_drag_box_ymax - 2), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y1 = max(min((level_bound_y2 - 1080), mouse_drag_box_ymax), level_bound_y1)
            lvlwire_delete_non_valids()
            ds_list_destroy(li_objects_in_box)
            break
    }

    return 1;
}
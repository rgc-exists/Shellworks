if(keyboard_check(ord("X"))){
    return toolplace_delete_blocks_all_in_rect(argument0, argument1)
} else if(keyboard_check(vk_lalt)){
    return toolplace_fill_with_wall_blocks_noszielimit(argument0, argument1)
} else if(keyboard_check(vk_ralt) && !(keyboard_check_pressed(vk_lalt))){
    return toolplace_fill_with_blocks(argument0, argument1)
} else if(keyboard_check(ord("B"))){
    return toolplace_fill_with_stripes(argument0, argument1)
} else if(keyboard_check(ord("C"))){
    return toolplace_fill_with_wall_blocks(argument0, argument1)
} else {
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step_one_by_one(argument0, 4, 16777215, sou_laser_04, 1.3, 0.1)
            break
        case 4:
            hlp_show_placement_preview(argument0)
            break
        case 2:
            if(!(global.setting_place_multiple_players && argument0.custom_tool_or_object_id == "player") && !(global.setting_place_multiple_oneAtATime_objs) && !keyboard_check(ord("Z"))){
                while (ds_list_size(argument0.li_placed_instances) > 0){
                    ds_list_size(argument0.li_placed_instances)
                    instance_destroy(ds_list_find_value(argument0.li_placed_instances, 0))
                }
            }
            created_inst_x = ((mouse_drag_box_current_x * 60) + 30)
            created_inst_y = ((mouse_drag_box_current_y * 60) + 30)
            quicktool_sprite = argument0.preview_sprite_index_once_placed
            img_angle = argument0.image_angle
            img_xscale = argument0.image_xscale
            img_yscale = argument0.image_yscale
            img_pivot_x = ((sprite_get_xoffset(quicktool_sprite) - argument0.placement_offset_x) * img_xscale)
            img_pivot_y = ((sprite_get_yoffset(quicktool_sprite) - argument0.placement_offset_y) * img_yscale)
            img_size_w = (sprite_get_width(quicktool_sprite) * img_xscale)
            img_size_h = (sprite_get_height(quicktool_sprite) * img_yscale)
            xplus = (((-img_size_w) * 0.5) + img_pivot_x)
            yplus = (((-img_size_h) * 0.5) + img_pivot_y)
            created_inst_x += (lengthdir_x(xplus, img_angle) - lengthdir_y(yplus, img_angle))
            created_inst_y += (lengthdir_y(xplus, img_angle) + lengthdir_x(yplus, img_angle))
            tool_id = argument0.custom_tool_or_object_id
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
            created_inst = instance_create_layer((created_inst_x + xoffseet), (created_inst_y + yoffseet), argument0.preview_layer, argument0.object_index_in_editor)
            created_inst.sprite_index = argument0.preview_sprite_index_once_placed
            created_inst.image_index = argument0.preview_image_index
            created_inst.image_blend = argument0.preview_color
            created_inst.image_angle = img_angle
            created_inst.image_xscale = img_xscale
            created_inst.image_yscale = img_yscale
            created_inst.toolStruct = argument0
            ds_list_add(argument0.li_placed_instances, created_inst)
            hlp_copy_tool_properties_to_newly_created_obj(argument0, created_inst)
            call_after_initializing_new_level_editor_object(created_inst)
            level_bound_x1 = min(level_bound_x1, (mouse_drag_box_current_x * 60))
            level_bound_x2 = max(level_bound_x2, (mouse_drag_box_current_x * 60))
            level_bound_y1 = min(level_bound_y1, (mouse_drag_box_current_y * 60))
            level_bound_y2 = max(level_bound_y2, (mouse_drag_box_current_y * 60))
            break
    }

    return 1;
}
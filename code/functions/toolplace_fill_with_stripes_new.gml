switch argument1
{
    case 0:
        hlp_toolplace_start_dragging_box(argument0)
        break
    case 1:
        hlp_toolplace_drag_box_step(argument0, 4, 16777215, sou_laser_04, 1.3, 0.1)
        break
    case 4:
        hlp_show_placement_preview(argument0)
        break
    case 2:
        mouse_drag_box_xmin = min(mouse_drag_box_start_x, mouse_drag_box_current_x)
        mouse_drag_box_xmax = (max(mouse_drag_box_start_x, mouse_drag_box_current_x) + 1)
        mouse_drag_box_ymin = min(mouse_drag_box_start_y, mouse_drag_box_current_y)
        mouse_drag_box_ymax = (max(mouse_drag_box_start_y, mouse_drag_box_current_y) + 1)
        level_bound_x1 = min(level_bound_x1, (mouse_drag_box_xmin * 60))
        level_bound_x2 = max(level_bound_x2, (mouse_drag_box_xmax * 60))
        level_bound_y1 = min(level_bound_y1, (mouse_drag_box_ymin * 60))
        level_bound_y2 = max(level_bound_y2, (mouse_drag_box_ymax * 60))
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
        collision_rectangle_list((((mouse_drag_box_xmin * 60) + 2) + xoffseet), (((mouse_drag_box_ymin * 60) + 2) + yoffseet), (((mouse_drag_box_xmax * 60) - 2) + xoffseet), (((mouse_drag_box_ymax * 60) - 2) + yoffseet), argument0.object_index_in_editor, 1, 1, li_objects_in_box, 0)
        if (((argument0.image_angle == 0 || argument0.image_angle == 180) && !keyboard_check(vk_ralt)) || keyboard_check(vk_lalt))
        {
            for (xxplace = mouse_drag_box_xmin; xxplace < mouse_drag_box_xmax; xxplace++)
            {
                created_inst_x = ((xxplace * 60) + 30)
                created_inst_y = ((mouse_drag_box_ymin + mouse_drag_box_ymax) * 30)
                quicktool_sprite = argument0.preview_sprite_index_once_placed
                img_angle = argument0.image_angle
                img_xscale = 1
                img_yscale = (mouse_drag_box_ymax - mouse_drag_box_ymin)
                img_pivot_x = ((sprite_get_xoffset(quicktool_sprite) - argument0.placement_offset_x) * img_xscale)
                img_pivot_y = ((sprite_get_yoffset(quicktool_sprite) - argument0.placement_offset_y) * img_yscale)
                img_size_w = (sprite_get_width(quicktool_sprite) * img_xscale)
                img_size_h = (sprite_get_height(quicktool_sprite) * img_yscale)
                xplus = (((-img_size_w) * 0.5) + img_pivot_x)
                yplus = (((-img_size_h) * 0.5) + img_pivot_y)
                created_inst_x += ((lengthdir_x(xplus, img_angle) - lengthdir_y(yplus, img_angle)) + xoffseet)
                created_inst_y += ((lengthdir_y(xplus, img_angle) + lengthdir_x(yplus, img_angle)) + yoffseet)
                tool_id = argument0.custom_tool_or_object_id
                canbuild = 1
                indx = 0
                while (indx < ds_list_size(li_objects_in_box))
                {
                    inst_check = ds_list_find_value(li_objects_in_box, indx)
                    if (inst_check.sprite_index != quicktool_sprite)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.x != created_inst_x)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.y != created_inst_y)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.image_angle != img_angle)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.image_xscale != img_xscale)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.image_yscale != img_yscale)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.toolStruct != argument0)
                    {
                        indx++
                        continue
                    }
                    else
                    {
                        canbuild = 0
                        break
                    }
                }
                if (!canbuild)
                {
                    return false;
                }
                else
                {
                    created_inst = instance_create_layer(created_inst_x, created_inst_y, argument0.preview_layer, argument0.object_index_in_editor)
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
                }
            }
        }
        else if (argument0.image_angle == 90 || argument0.image_angle == 270 || keyboard_check(vk_ralt))
        { 
            for (yyplace = mouse_drag_box_ymin; yyplace < mouse_drag_box_ymax; yyplace++)
            {
                created_inst_x = ((mouse_drag_box_xmin + mouse_drag_box_xmax) * 30)
                created_inst_y = ((yyplace * 60) + 30)
                quicktool_sprite = argument0.preview_sprite_index_once_placed
                img_angle = argument0.image_angle
                img_xscale = 1
                img_yscale = (mouse_drag_box_xmax - mouse_drag_box_xmin)
                img_pivot_x = ((sprite_get_xoffset(quicktool_sprite) - argument0.placement_offset_x) * img_xscale)
                img_pivot_y = ((sprite_get_yoffset(quicktool_sprite) - argument0.placement_offset_y) * img_yscale)
                img_size_w = (sprite_get_width(quicktool_sprite) * img_xscale)
                img_size_h = (sprite_get_height(quicktool_sprite) * img_yscale)
                xplus = (((-img_size_w) * 0.5) + img_pivot_x)
                yplus = (((-img_size_h) * 0.5) + img_pivot_y)
                created_inst_x += ((lengthdir_x(xplus, img_angle) - lengthdir_y(yplus, img_angle)) + xoffseet)
                created_inst_y += ((lengthdir_y(xplus, img_angle) + lengthdir_x(yplus, img_angle)) + yoffseet)
                tool_id = argument0.custom_tool_or_object_id
                canbuild = 1
                indx = 0
                while (indx < ds_list_size(li_objects_in_box))
                {
                    inst_check = ds_list_find_value(li_objects_in_box, indx)
                    if (inst_check.sprite_index != quicktool_sprite)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.x != created_inst_x)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.y != created_inst_y)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.image_angle != img_angle)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.image_xscale != img_xscale)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.image_yscale != img_yscale)
                    {
                        indx++
                        continue
                    }
                    else if (inst_check.toolStruct != argument0)
                    {
                        indx++
                        continue
                    }
                    else
                    {
                        canbuild = 0
                        break
                    }
                }
                if (!canbuild)
                {
                    return false;
                }
                else
                {
                    created_inst = instance_create_layer(created_inst_x, created_inst_y, argument0.preview_layer, argument0.object_index_in_editor)
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
                }
            }
        }
        ds_list_destroy(li_objects_in_box)
        break
    }

return 1;
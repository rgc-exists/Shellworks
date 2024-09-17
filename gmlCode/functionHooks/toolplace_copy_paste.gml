var x_off = ds_map_find_value(argument0.ds_map_tool_properties, "copyxoff").value
var y_off = ds_map_find_value(argument0.ds_map_tool_properties, "copyyoff").value

switch argument1
{
    case CLICK:
        hlp_toolplace_start_dragging_box(argument0)
        break
    case HOLD:
        hlp_toolplace_drag_box_step_one_by_one(argument0, 4, 16777215, sou_laser_04, 1.3, 0.1)
        var mx = mouse_drag_box_current_x
        var my = mouse_drag_box_current_y
        for (var i = 0; i < array_length(clipboard); i++)
            hlp_show_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off)
        break
    case HOVER:
        mx = floor((global.cursor_in_level_x / 60))
        my = floor((global.cursor_in_level_y / 60))
        
        var valid_copyable_objects = ds_list_create()

        for (i = 0; i < array_length(clipboard); i++)
        {
            var _Ts = clipboard[i].toolStruct
            if ((_Ts.placement_script == gml_Script_toolplace_fill_with_wall_blocks) && ((argument0.image_angle % 90) != 0))
            {
            }
            else if variable_struct_exists(_Ts, "can_be_copied")
            {
                if ((_Ts.can_be_copied == 4) && ((clipboard[i].scaleX != 1) || (clipboard[i].scaleY != 1)) && (argument0.image_angle != 0))
                {
                }
                else if ((_Ts.can_be_copied == 2) && (argument0.image_angle != 0))
                {
                }
                else if ((_Ts.can_be_copied == 0))
                {
                }
                else {
                    hlp_show_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off)
                    ds_list_add(valid_copyable_objects, clipboard[i])
                }
            }
            else {
                hlp_show_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off)
                ds_list_add(valid_copyable_objects, clipboard[i])
            }
        }
        
        /*
        if (variable_instance_exists(id, "clipboard_wires"))
        {
            alphana = ((sin((current_time / 100)) * 0.3) + 0.7)

            var created_inst_x = mx * 60
            var created_inst_y = my * 60
            for (var i = 0; i < array_length(clipboard_wires); i++)
            {
                var ww = clipboard_wires[i]
                var thisWireFrom = clipboard[ww[0]]
                var thisWireTo = clipboard[ww[1]]

                if (ds_list_find_index(valid_copyable_objects, thisWireFrom) == -1 || ds_list_find_index(valid_copyable_objects, thisWireTo) == -1)
                    continue;

                var rot_data_from = hlp_rotate_object_data(
                    created_inst_x, created_inst_y, created_inst_x + thisWireFrom.x, created_inst_y + thisWireFrom.y,
                    argument0.image_angle, thisWireFrom.toolStruct, thisWireFrom, x_off, y_off
                )
                var rot_data_to = hlp_rotate_object_data(
                    created_inst_x, created_inst_y, created_inst_x + thisWireTo.x, created_inst_y + thisWireTo.y,
                    argument0.image_angle, thisWireTo.toolStruct, thisWireTo, x_off, y_off
                )

                var toolStruct_from = thisWireFrom.toolStruct
                var toolStruct_to = thisWireTo.toolStruct
                var offset1 = ds_map_find_value(global.database_wireOffsets, toolStruct_from.custom_tool_or_object_id)
                var offset2 = ds_map_find_value(global.database_wireOffsets, toolStruct_to.custom_tool_or_object_id)
                if(is_undefined(offset1)) offset1 = [0, 0]
                if(is_undefined(offset2)) offset2 = [0, 0]
                var twX1 = rot_data_from.x + offset1[0]
                var twY1 = rot_data_from.y + offset1[1]
                var twX2 = rot_data_to.x + offset2[0]
                var twY2 = rot_data_to.y + offset2[1]
                
                scr_draw_puzzle_laser(twX1, twY1, twX2, twY2, 12, obj_levelstyler.col_snail, alphana)

            }
        }
        */
        ds_list_destroy(valid_copyable_objects)

        break
    case END:

        var created_instances = []

        created_inst_x = (mouse_drag_box_current_x * 60)
        created_inst_y = (mouse_drag_box_current_y * 60)
        for (i = 0; i < array_length(clipboard); i++)
        {
            var clip_entry = clipboard[i]
            _Ts = clipboard[i].toolStruct
            if ((_Ts.placement_script == gml_Script_toolplace_fill_with_wall_blocks) && ((argument0.image_angle % 90) != 0))
            {
            }
            else if variable_struct_exists(_Ts, "can_be_copied")
            {
                if ((_Ts.can_be_copied == 2) && (argument0.image_angle != 0))
                {
                }
                else
                {
                    var rot_data = hlp_rotate_object_data(created_inst_x, created_inst_y, (created_inst_x + clip_entry.x), (created_inst_y + clip_entry.y), argument0.image_angle, clip_entry.toolStruct, clip_entry, x_off, y_off)
                    created_inst = instance_create_layer(rot_data.x, rot_data.y, _Ts.preview_layer, _Ts.object_index_in_editor)

                    array_push(created_instances, created_inst)

                    created_inst.sprite_index = _Ts.preview_sprite_index_once_placed
                    created_inst.image_index = _Ts.preview_image_index
                    created_inst.image_blend = _Ts.preview_color
                    created_inst.image_angle = rot_data.image_angle
                    created_inst.image_xscale = rot_data.image_xscale
                    created_inst.image_yscale = rot_data.image_yscale
                    ds_list_add(_Ts.li_placed_instances, created_inst)
                    created_inst.map_properties = ds_map_create()
                    ds_map_copy(created_inst.map_properties, clip_entry.properties)
                    created_inst.toolStruct = _Ts
                    if ds_map_exists(clip_entry.properties, "tex")
                    {
                        if ds_map_exists(_Ts.ds_map_tool_properties, "tex")
                        {
                            tex = ds_map_find_value(clip_entry.properties, "tex")
                            created_inst.sprite_index = script_execute(ds_map_find_value(_Ts.ds_map_tool_properties, "tex").array_sprite_picking_functions[tex], true)
                        }
                    }
                    call_after_initializing_new_level_editor_object(created_inst)
                    toolplace_delete_similar(created_inst)
                    level_bound_x1 = min(level_bound_x1, (floor((created_inst.bbox_left / 60)) * 60))
                    level_bound_x2 = max(level_bound_x2, (ceil((created_inst.bbox_right / 60)) * 60))
                    level_bound_y1 = min(level_bound_y1, (floor((created_inst.bbox_top / 60)) * 60))
                    level_bound_y2 = max(level_bound_y2, (ceil((created_inst.bbox_bottom / 60)) * 60))
                }
            }
            else
            {
                var rot_data = hlp_rotate_object_data(created_inst_x, created_inst_y, (created_inst_x + clip_entry.x), (created_inst_y + clip_entry.y), argument0.image_angle, clip_entry.toolStruct, clip_entry, x_off, y_off)
                created_inst = instance_create_layer(rot_data.x, rot_data.y, _Ts.preview_layer, _Ts.object_index_in_editor)
                
                array_push(created_instances, created_inst)
                
                created_inst.sprite_index = _Ts.preview_sprite_index_once_placed
                created_inst.image_index = _Ts.preview_image_index
                created_inst.image_blend = _Ts.preview_color
                created_inst.image_angle = rot_data.image_angle
                created_inst.image_xscale = rot_data.image_xscale
                created_inst.image_yscale = rot_data.image_yscale
                ds_list_add(_Ts.li_placed_instances, created_inst)
                created_inst.map_properties = ds_map_create()
                ds_map_copy(created_inst.map_properties, clip_entry.properties)
                created_inst.toolStruct = _Ts
                if ds_map_exists(clip_entry.properties, "tex")
                {
                    if ds_map_exists(_Ts.ds_map_tool_properties, "tex")
                    {
                        tex = ds_map_find_value(clip_entry.properties, "tex")
                        created_inst.sprite_index = script_execute(ds_map_find_value(_Ts.ds_map_tool_properties, "tex").array_sprite_picking_functions[tex], true)
                    }
                }
                call_after_initializing_new_level_editor_object(created_inst)
                toolplace_delete_similar(created_inst)
                level_bound_x1 = min(level_bound_x1, (floor((created_inst.bbox_left / 60)) * 60))
                level_bound_x2 = max(level_bound_x2, (ceil((created_inst.bbox_right / 60)) * 60))
                level_bound_y1 = min(level_bound_y1, (floor((created_inst.bbox_top / 60)) * 60))
                level_bound_y2 = max(level_bound_y2, (ceil((created_inst.bbox_bottom / 60)) * 60))
            }
        }

        if (variable_instance_exists(id, "clipboard_wires"))
        {
            for (var i = 0; i < array_length(clipboard_wires); i++)
            {
                var ww = clipboard_wires[i]
                show_debug_message(ww)
                lvlwire_create(
                    created_instances[ww[0]], 
                    created_instances[ww[1]]
                )
            }
        }
        break
}

return true;

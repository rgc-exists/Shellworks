var x_off = ds_map_find_value(argument0.ds_map_tool_properties, "copyxoff").value
var y_off = ds_map_find_value(argument0.ds_map_tool_properties, "copyyoff").value
switch argument1
{
    case 0:
        hlp_toolplace_start_dragging_box(argument0)
        break
    case 1:
        hlp_toolplace_drag_box_step_one_by_one(argument0, 4, 16777215, 108, 1.3, 0.1)
        var mx = mouse_drag_box_current_x
        var my = mouse_drag_box_current_y
        for (i = 0; i < array_length(clipboard); i++)
            hlp_show_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off)
        break
    case 4:
        mx = floor((global.cursor_in_level_x / 60))
        my = floor((global.cursor_in_level_y / 60))
        for (i = 0; i < array_length(clipboard); i++)
        {
            var _Ts = clipboard[i].toolStruct
            if (_Ts.placement_script == gml_Script_toolplace_fill_with_wall_blocks && (argument0.image_angle % 90) != 0)
            {
            }
            else if variable_struct_exists(_Ts, "can_be_copied")
            {
                if (_Ts.can_be_copied == 4 && (clipboard[i].scaleX != 1 || clipboard[i].scaleY != 1) && argument0.image_angle != 0)
                {
                }
                else if (_Ts.can_be_copied == 2 && argument0.image_angle != 0)
                {
                }
                else
                    hlp_show_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off)
            }
            else
                hlp_show_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off)
        }
        if(variable_instance_exists(id, "clipboard_wires")){
            for(var w = 0; w < ds_list_size(clipboard_wires); w++){
                thisWire = ds_list_find_value(clipboard_wires, w)
                var thisWireFrom = clipboard[thisWire[0]]
                var thisWireTo = clipboard[thisWire[1]]
                twX1 = mx * 60 + x_off + variable_struct_get(thisWireFrom, "x")
                twY1 = my * 60 + y_off + variable_struct_get(thisWireFrom, "y")
                twX2 = mx * 60 + x_off + variable_struct_get(thisWireTo, "x")
                twY2 = my * 60 + y_off + variable_struct_get(thisWireTo, "y")
                draw_set_color(c_white)
                draw_set_alpha(.8)
                scr_draw_puzzle_laser(twX1, twY1, twX2, twY2, 12, obj_levelstyler.col_snail, 1)
            }
        }
        break
    case 2:
        var created_instances = ds_list_create()
        created_inst_x = (mouse_drag_box_current_x * 60)
        created_inst_y = (mouse_drag_box_current_y * 60)
        for (i = 0; i < array_length(clipboard); i++)
        {
            var clip_entry = clipboard[i]
            _Ts = clipboard[i].toolStruct
            if (_Ts.placement_script == gml_Script_toolplace_fill_with_wall_blocks && (argument0.image_angle % 90) != 0)
            {
            }
            else if variable_struct_exists(_Ts, "can_be_copied")
            {
                if (_Ts.can_be_copied == 2 && argument0.image_angle != 0)
                {
                }
                else
                {
                    rot_data = hlp_rotate_object_data(created_inst_x, created_inst_y, (created_inst_x + clip_entry.x), (created_inst_y + clip_entry.y), argument0.image_angle, clip_entry.toolStruct, clip_entry, x_off, y_off)
                    created_inst = instance_create_layer(rot_data.x, rot_data.y, _Ts.preview_layer, _Ts.object_index_in_editor)
                    ds_list_add(created_instances, created_inst)
                    created_inst.sprite_index = _Ts.preview_sprite_index_once_placed
                    created_inst.image_index = _Ts.preview_image_index
                    created_inst.image_blend = _Ts.preview_color
                    created_inst.image_angle = rot_data.image_angle
                    created_inst.image_xscale = rot_data.image_xscale
                    created_inst.image_yscale = rot_data.image_yscale
                    ds_list_add(_Ts.li_placed_instances, created_inst)
                    created_inst.map_properties = clip_entry.properties
                    created_inst.toolStruct = _Ts
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
                rot_data = hlp_rotate_object_data(created_inst_x, created_inst_y, (created_inst_x + clip_entry.x), (created_inst_y + clip_entry.y), argument0.image_angle, clip_entry.toolStruct, clip_entry, x_off, y_off)
                created_inst = instance_create_layer(rot_data.x, rot_data.y, _Ts.preview_layer, _Ts.object_index_in_editor)
                ds_list_add(created_instances, created_inst)
                created_inst.sprite_index = _Ts.preview_sprite_index_once_placed
                created_inst.image_index = _Ts.preview_image_index
                created_inst.image_blend = _Ts.preview_color
                created_inst.image_angle = rot_data.image_angle
                created_inst.image_xscale = rot_data.image_xscale
                created_inst.image_yscale = rot_data.image_yscale
                ds_list_add(_Ts.li_placed_instances, created_inst)
                created_inst.map_properties = clip_entry.properties
                created_inst.toolStruct = _Ts
                call_after_initializing_new_level_editor_object(created_inst)
                toolplace_delete_similar(created_inst)
                level_bound_x1 = min(level_bound_x1, (floor((created_inst.bbox_left / 60)) * 60))
                level_bound_x2 = max(level_bound_x2, (ceil((created_inst.bbox_right / 60)) * 60))
                level_bound_y1 = min(level_bound_y1, (floor((created_inst.bbox_top / 60)) * 60))
                level_bound_y2 = max(level_bound_y2, (ceil((created_inst.bbox_bottom / 60)) * 60))
            }
        }
        if(variable_instance_exists(id, "clipboard_wires")){
            for(i = 0; i < ds_list_size(clipboard_wires); i++){
                var ww = ds_list_find_value(clipboard_wires, i)
                lvlwire_create(ds_list_find_value(created_instances, ww[0]), ds_list_find_value(created_instances, ww[1]))
            }
        }
        ds_list_destroy(created_instances)
        break
}

return 1;

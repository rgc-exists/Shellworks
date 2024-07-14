/*
==================================================================================================================
NOTE TO SELF! I ran into an issue where deleting a piece of glass crashed the game.
Be sure to look into that, as well as the bug where it just... doesn't let you delete certain objects sometimes.
==================================================================================================================
*/



var x_off = ds_map_find_value(argument0.ds_map_tool_properties, "copyxoff").value
var y_off = ds_map_find_value(argument0.ds_map_tool_properties, "copyyoff").value

var xscale_multp = ds_map_find_value(argument0.ds_map_tool_properties, "advcopy_xscale").value
if(abs(xscale_multp) < 0.05){
    if(xscale_multp >= 0) xscale_multp = 0.05
    if(xscale_multp < 0) xscale_multp = -0.05
}
var yscale_multp = ds_map_find_value(argument0.ds_map_tool_properties, "advcopy_yscale").value
if(abs(yscale_multp) < 0.05){
    if(yscale_multp >= 0) yscale_multp = 0.05
    if(yscale_multp < 0) yscale_multp = -0.05
}

var grid_xscale = ds_map_find_value(argument0.ds_map_tool_properties, "grid_width").value
var grid_yscale = ds_map_find_value(argument0.ds_map_tool_properties, "grid_height").value

var wall_snapping = ds_map_find_value(argument0.ds_map_tool_properties, "wall_snapping").value
var wallsnap_grid_xscale = 60
if(wall_snapping == 2) wallsnap_grid_xscale = grid_xscale
var wallsnap_grid_yscale = 60
if(wall_snapping == 2) wallsnap_grid_yscale = grid_yscale

var do_randomization = ds_map_find_value(argument0.ds_map_tool_properties, "pl_dorng")
var randomX_min = ds_map_find_value(argument0.ds_map_tool_properties, "randomX_min").value
var randomX_max = ds_map_find_value(argument0.ds_map_tool_properties, "randomX_max").value
var randomY_min = ds_map_find_value(argument0.ds_map_tool_properties, "randomY_min").value
var randomY_max = ds_map_find_value(argument0.ds_map_tool_properties, "randomY_max").value

switch argument1
{
    case CLICK:
        gml_Script_hlp_toolplace_start_dragging_box_advanced(argument0, grid_xscale, grid_yscale)
        break
    case HOLD:
        gml_Script_hlp_toolplace_drag_box_step_advanced(argument0, 4, 16777215, 108, 1.3, 0.1, grid_xscale, grid_yscale)
        var mx = mouse_drag_box_current_x
        var my = mouse_drag_box_current_y
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
                    gml_Script_hlp_show_advanced_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off,
                    xscale_multp, yscale_multp, grid_xscale, grid_yscale, wall_snapping)
                    ds_list_add(valid_copyable_objects, clipboard[i])
                }
            }
            else {
                gml_Script_hlp_show_advanced_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off,
                xscale_multp, yscale_multp, grid_xscale, grid_yscale, wall_snapping)
                ds_list_add(valid_copyable_objects, clipboard[i])
            }
        }        


        ds_list_destroy(valid_copyable_objects)
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
                    gml_Script_hlp_show_advanced_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off,
                    xscale_multp, yscale_multp, grid_xscale, grid_yscale, wall_snapping)
                    ds_list_add(valid_copyable_objects, clipboard[i])
                }
            }
            else {
                gml_Script_hlp_show_advanced_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off,
                xscale_multp, yscale_multp, grid_xscale, grid_yscale, wall_snapping)
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

                var rot_data_from = gml_Script_hlp_advanced_rotate_object_data(
                    created_inst_x, created_inst_y, created_inst_x + thisWireFrom.x, created_inst_y + thisWireFrom.y,
                    argument0.image_angle, thisWireFrom.toolStruct, thisWireFrom, x_off, y_off,
                    xscale_multp, yscale_multp, grid_xscale, grid_yscale, wall_snapping
                )
                var rot_data_to = gml_Script_hlp_advanced_rotate_object_data(
                    created_inst_x, created_inst_y, created_inst_x + thisWireTo.x, created_inst_y + thisWireTo.y,
                    argument0.image_angle, thisWireTo.toolStruct, thisWireTo, x_off, y_off,
                    xscale_multp, yscale_multp, grid_xscale, grid_yscale, wall_snapping
                )

                var offset1 = ds_map_find_value(global.database_wireOffsets, thisWireFrom.custom_tool_or_object_id)
                var offset2 = ds_map_find_value(global.database_wireOffsets, thisWireTo.custom_tool_or_object_id)
                if(offset1 == -1) offset1 = [0, 0]
                if(offset2 == -1) offset2 = [0, 0]

                var twX1 = scr_sprite_to_world_x(thisWireFrom, offset1[0], offset1[1])
                var twY1 = scr_sprite_to_world_y(thisWireFrom, offset1[0], offset1[1])
                var twX2 = scr_sprite_to_world_x(thisWireTo, offset2[0], offset2[1])
                var twY2 = scr_sprite_to_world_y(thisWireTo, offset2[0], offset2[1])
                
                scr_draw_puzzle_laser(twX1, twY1, twX2, twY2, 12, obj_levelstyler.col_snail, alphana)

            }
        }
        */

        ds_list_destroy(valid_copyable_objects)
        break
    case END:
        
        mouse_drag_box_xmin = min(mouse_drag_box_start_x, mouse_drag_box_current_x)
        mouse_drag_box_xmax = (max(mouse_drag_box_start_x, mouse_drag_box_current_x) + 1)
        mouse_drag_box_ymin = min(mouse_drag_box_start_y, mouse_drag_box_current_y)
        mouse_drag_box_ymax = (max(mouse_drag_box_start_y, mouse_drag_box_current_y) + 1)
        level_bound_x1 = min(level_bound_x1, floor(mouse_drag_box_xmin * grid_xscale / 60) * 60)
        level_bound_x2 = max(level_bound_x2, ceil(mouse_drag_box_xmax * grid_xscale / 60) * 60)
        level_bound_y1 = min(level_bound_y1, floor(mouse_drag_box_ymin * grid_yscale / 60) * 60)
        level_bound_y2 = max(level_bound_y2, ceil(mouse_drag_box_ymax * grid_yscale / 60) * 60)
        if is_undefined(do_randomization)
            do_randomization = false
        else
            do_randomization = do_randomization.value

        xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
        if is_undefined(xoffseet)
            xoffseet = obj_lt_music_trigger
        else
            xoffseet = xoffseet.value
        yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
        if is_undefined(yoffseet)
            yoffseet = obj_lt_music_trigger
        else
            yoffseet = yoffseet.value

        var x1 = ((mouse_drag_box_xmin) + xoffseet)
        var y1 = ((mouse_drag_box_ymin) + yoffseet)
        var x2 = ((mouse_drag_box_xmax) + xoffseet)
        var y2 = ((mouse_drag_box_ymax) + yoffseet)

        last_offset = 0
        next_duplicate = false
        var created_instances = []
        var mouse_drag_x_size = (mouse_drag_box_xmax - mouse_drag_box_xmin) / grid_xscale
        var mouse_drag_y_size = (mouse_drag_box_ymax - mouse_drag_box_ymin) / grid_yscale
        
        created_inst_x = (mouse_drag_box_current_x * 60)
        created_inst_y = (mouse_drag_box_current_y * 60)
        for (xxplace = mouse_drag_box_xmin; xxplace < mouse_drag_box_xmax; xxplace++)
        {
            for (yyplace = mouse_drag_box_ymin; yyplace < mouse_drag_box_ymax; yyplace++)
            {
                created_inst_x = xxplace * grid_xscale
                created_inst_y = yyplace * grid_yscale
                if do_randomization
                {
                    var prev_inst_x = created_inst_x
                    var prev_inst_y = created_inst_y
                    
                    created_inst_x += irandom_range(randomX_min, randomX_max)
                    created_inst_y += irandom_range(randomY_min, randomY_max)
                    
                    /*
                    if(
                        created_inst_x < level_bound_x1 || created_inst_x > level_bound_x2 ||
                        created_inst_y < level_bound_y1 || created_inst_y > level_bound_y2 || 
                        created_inst_x < mouse_drag_box_xmin * grid_xscale || created_inst_x > mouse_drag_box_xmax * grid_xscale ||
                        created_inst_x < mouse_drag_box_ymin * grid_yscale || created_inst_x > mouse_drag_box_ymax * grid_yscale
                    ){
                        yyplace--
                        next_duplicate = true
                        created_inst_x = prev_inst_x
                        created_inst_y = prev_inst_y
                    } else {
                        next_duplicate = false
                    }
                    */
                }
                
                canbuild = true
                var created_instances = []
                for (i = 0; i < array_length(clipboard); i++)
                {
                    var clip_entry = clipboard[i]
                    _Ts = clipboard[i].toolStruct
                    if (_Ts.placement_script == gml_Script_toolplace_fill_with_wall_blocks && (argument0.image_angle % 90) != 0 && wall_snapping)
                    {
                    }
                    else if variable_struct_exists(_Ts, "can_be_copied")
                    {
                        if (_Ts.can_be_copied == 2 && argument0.image_angle != 0)
                        {
                        }
                        else
                        {
                            rot_data = gml_Script_hlp_advanced_rotate_object_data(created_inst_x, created_inst_y, (created_inst_x + clip_entry.x), (created_inst_y + clip_entry.y), argument0.image_angle, clip_entry.toolStruct, clip_entry, x_off, y_off, xscale_multp, yscale_multp, grid_xscale, grid_yscale, wall_snapping)
                            created_inst = instance_create_layer(rot_data.x, rot_data.y, _Ts.preview_layer, _Ts.object_index_in_editor)
                            array_push(created_instances, created_inst)
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
                            level_bound_x1 = min(level_bound_x1, floor(mouse_drag_box_xmin * grid_xscale / 60) * 60)
                            level_bound_x2 = max(level_bound_x2, ceil(mouse_drag_box_xmax * grid_xscale / 60) * 60)
                            level_bound_y1 = min(level_bound_y1, floor(mouse_drag_box_ymin * grid_yscale / 60) * 60)
                            level_bound_y2 = max(level_bound_y2, ceil(mouse_drag_box_ymax * grid_yscale / 60) * 60)
                        }
                    }
                    else
                    {
                        rot_data = gml_Script_hlp_advanced_rotate_object_data(created_inst_x, created_inst_y, (created_inst_x + clip_entry.x), (created_inst_y + clip_entry.y), argument0.image_angle, clip_entry.toolStruct, clip_entry, x_off, y_off, xscale_multp, yscale_multp, grid_xscale, grid_yscale, wall_snapping)
                        created_inst = instance_create_layer(rot_data.x, rot_data.y, _Ts.preview_layer, _Ts.object_index_in_editor)
                        array_push(created_instances, created_inst)
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
                        level_bound_x1 = min(level_bound_x1, floor(mouse_drag_box_xmin * grid_xscale / 60) * 60)
                        level_bound_x2 = max(level_bound_x2, ceil(mouse_drag_box_xmax * grid_xscale / 60) * 60)
                        level_bound_y1 = min(level_bound_y1, floor(mouse_drag_box_ymin * grid_yscale / 60) * 60)
                        level_bound_y2 = max(level_bound_y2, ceil(mouse_drag_box_ymax * grid_yscale / 60) * 60)
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
            }
        }
        break
}

return true;
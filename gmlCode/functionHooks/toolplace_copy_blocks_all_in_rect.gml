switch argument1
{
    case CLICK:
        hlp_toolplace_start_dragging_box(argument0)
        break
    case HOLD:
        hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_snail, sou_jump_06, 0.7, 0.1)
        break
    case END:
        mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
        mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
        mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
        mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
        
        li_objects_in_box = ds_list_create()
        collision_rectangle_list((mouse_drag_box_xmin + 2), (mouse_drag_box_ymin + 2), (mouse_drag_box_xmax - 2), (mouse_drag_box_ymax - 2), obj_lvlobj_parent, true, true, li_objects_in_box, false)
        scr_delete_clipboard()

        clipboard_instances = ds_list_create()


        for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
        {
            inst_check = ds_list_find_value(li_objects_in_box, indx)
            var toolStruct = inst_check.toolStruct

            if ((toolStruct.placement_script == gml_Script_toolplace_singleton_placement)
            && !global.setting_copy_tool_bypass)
            {
            }
            else if variable_struct_exists(toolStruct, "can_be_copied") && !global.setting_copy_tool_bypass
            {
                if (toolStruct.can_be_copied == 0) || ((toolStruct.can_be_copied == 3) && ((inst_check.image_xscale != 1) || (inst_check.image_yscale != 1)))
                {
                }
                else {

                    
                    ds_list_add(clipboard_instances, inst_check.id)
                }
            }
            else {
                
                
                ds_list_add(clipboard_instances, real(inst_check.id))
            }
        }
        
        if(global.setting_preserve_copy_order){
            ds_list_sort(clipboard_instances, true);
        }

        for(var c = 0; c < ds_list_size(clipboard_instances); c++){
            var inst = ds_list_find_value(clipboard_instances, c)
            array_push(clipboard, scr_create_clipboard_struct_from_object((mouse_drag_box_start_x * 60), (mouse_drag_box_start_y * 60), inst))
        }
        
        clipboard_wires = []
        if(global.setting_copyable_wires){
            if (array_length(clipboard) > 0)
            {
                clipboard_wires = []
                for (var i = 0; i < ds_list_size(clipboard_instances); i++)
                {
                    var from_obj = ds_list_find_value(clipboard_instances, i)
                    if (object_is_ancestor(from_obj.object_index, obj_lvlobj_wireable_parent))
                    {
                        for (var w = 0; w < ds_list_size(global.lvl_wires); w++){
                            var connection = ds_list_find_value(global.lvl_wires, w)
                            if (connection.from_obj == from_obj)
                            {
                                var to_obj = connection.to_obj 
                                if (ds_list_find_index(clipboard_instances, to_obj) != -1)
                                    array_push(clipboard_wires, [i, ds_list_find_index(clipboard_instances, to_obj)])
                            }
                        }
                    }
                }
            }
        }
        
        ds_list_destroy(clipboard_instances)



        ds_list_destroy(li_objects_in_box)
        lvlwire_delete_non_valids()

        global.current_clipboard = clipboard
        global.current_clipboard_wires = clipboard_wires
        break
    case HOVER:
        break
}

return true;
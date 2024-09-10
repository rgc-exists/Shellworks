// We dont reuse the copy tool one cause it isnt what we need we need to just get them
switch argument1
{
    case CLICK:
        hlp_toolplace_start_dragging_box(argument0)
        break;
    case HOLD:
        hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_td_turret_3, sou_jump_06, 0.7, 0.1);
        break;
    case END:
        mouse_drag_box_xmin = min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60;
        mouse_drag_box_xmax = (max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60;
        mouse_drag_box_ymin = min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60;
        mouse_drag_box_ymax = (max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60;
        if (variable_struct_exists(argument0, "li_objects_in_box"))
            ds_list_destroy(argument0.li_objects_in_box);
        argument0.li_objects_in_box = ds_list_create();
        collision_rectangle_list(mouse_drag_box_xmin + 2, mouse_drag_box_ymin + 2, mouse_drag_box_xmax - 2, mouse_drag_box_ymax - 2, obj_lvlobj_parent, true, true, argument0.li_objects_in_box, false);
        break;
    
    default:
        break;
}

return true;
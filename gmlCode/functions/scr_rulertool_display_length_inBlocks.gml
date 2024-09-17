switch argument1
{
    case 0:
        hlp_toolplace_start_dragging_box(argument0)
        break
    case 1:
        hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_bubbles, sou_laser_04, 1.3, 0.1)

        mouse_drag_box_xmin = min(mouse_drag_box_start_x, mouse_drag_box_current_x)
        mouse_drag_box_xmax = (max(mouse_drag_box_start_x, mouse_drag_box_current_x) + 1)
        mouse_drag_box_ymin = min(mouse_drag_box_start_y, mouse_drag_box_current_y)
        mouse_drag_box_ymax = (max(mouse_drag_box_start_y, mouse_drag_box_current_y) + 1)

        drag_area_width = mouse_drag_box_xmax - mouse_drag_box_xmin
        drag_area_height = mouse_drag_box_ymax - mouse_drag_box_ymin

        draw_set_font(font_aiTalk)
        draw_set_halign(fa_left)
        draw_set_valign(fa_bottom)
        draw_set_color(obj_levelstyler.col_bubbles)
        draw_text_transformed(mouse_drag_box_xmax * 60 + 20, mouse_drag_box_ymax * 60, "X: " + string(drag_area_width), 0.75 * obj_camera_control_level_editor.cam_zoom, 0.75 * obj_camera_control_level_editor.cam_zoom, 0)
        draw_set_halign(fa_right)
        draw_set_valign(fa_top)
        draw_text_transformed(mouse_drag_box_xmax * 60, mouse_drag_box_ymax * 60 + 20, "Y: " + string(drag_area_height), 0.75 * obj_camera_control_level_editor.cam_zoom, 0.75 * obj_camera_control_level_editor.cam_zoom, 0)
        break

}

return 1;
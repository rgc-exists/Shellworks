switch argument1
{
    case CLICK:
        // Checks if we are colliding with a level object
        drag_collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, obj_lvlobj_parent);
        if (drag_collision != noone)
        {
            hlp_draw_bounding_box_around_obj(drag_collision, 4, obj_levelstyler.col_td_turret_3);
            drag_current_toolstruct = drag_collision.toolStruct;

            drag_xoff = (drag_collision.x - global.cursor_in_level_x);
            drag_yoff = (drag_collision.y - global.cursor_in_level_y);
            prev_final_x = 0;
            prev_final_y = 0;
        }
        else
        {
            prev_final_x = 0;
            prev_final_y = 0;

            // Final check if we are hovering over the level bounds
            with (obj_level_editor_background)
            {
                if point_in_rectangle(global.cursor_in_level_x, global.cursor_in_level_y, (level_bound_x1 - line_width_outline_div2), (level_bound_y1 - line_width_outline), (level_bound_x2 + line_width_outline_div2), (level_bound_y1 + line_width_outline))
                    other.drag_collision = BOUND_TOP;
                else if point_in_rectangle(global.cursor_in_level_x, global.cursor_in_level_y, (level_bound_x1 - line_width_outline_div2), (level_bound_y2 - line_width_outline), (level_bound_x2 + line_width_outline_div2), (level_bound_y2 + line_width_outline))
                    other.drag_collision = BOUND_BOTTOM;
                else if point_in_rectangle(global.cursor_in_level_x, global.cursor_in_level_y, (level_bound_x1 - line_width_outline_div2), level_bound_y1, (level_bound_x1 + line_width_outline_div2), level_bound_y2)
                    other.drag_collision = BOUND_LEFT;
                else if point_in_rectangle(global.cursor_in_level_x, global.cursor_in_level_y, (level_bound_x2 - line_width_outline_div2), level_bound_y1, (level_bound_x2 + line_width_outline_div2), level_bound_y2)
                    other.drag_collision = BOUND_RIGHT;
            }
        }

        if (variable_struct_exists(argument0, "li_objects_in_box"))
        {
            if (variable_struct_exists(argument0, "cached_offsets"))
                ds_grid_destroy(argument0.cached_offsets);
            argument0.cached_offsets = ds_grid_create(2, ds_list_size(argument0.li_objects_in_box));
            for (var i = 0; i < ds_list_size(argument0.li_objects_in_box); i++) 
            {
                var toCache = ds_list_find_value(argument0.li_objects_in_box, i);

                ds_grid_add(argument0.cached_offsets, 0, i, toCache.x - global.cursor_in_level_x);
                ds_grid_add(argument0.cached_offsets, 1, i, toCache.y - global.cursor_in_level_y);
            }
        }
    case HOLD:
        if (!is_undefined(drag_collision))
        {
            // If we are dragging a boundary
            if (drag_collision <= BOUND_TOP)
            {
                var final_x = (round((global.cursor_in_level_x / 60)) * 60);
                var final_y = (round((global.cursor_in_level_y / 60)) * 60);
                if (drag_collision == BOUND_TOP) // Top
                {
                    if ((level_bound_y2 - final_y) < 1080)
                        final_y = (level_bound_y2 - 1080);
                    with (obj_level_editor_background)
                        scr_draw_line_sprite((level_bound_x1 - line_width_outline_div2), level_bound_y1, (level_bound_x2 + line_width_outline_div2), level_bound_y1, line_width_outline, c_white);
                    final_x = prev_final_x;
                    level_bound_y1 = final_y;
                }
                else if (drag_collision == BOUND_BOTTOM) // Bottom
                {
                    if ((final_y - level_bound_y1) < 1080)
                        final_y = (level_bound_y1 + 1080);
                    with (obj_level_editor_background)
                        scr_draw_line_sprite((level_bound_x1 - line_width_outline_div2), level_bound_y2, (level_bound_x2 + line_width_outline_div2), level_bound_y2, line_width_outline, c_white);
                    final_x = prev_final_x;
                    level_bound_y2 = final_y;
                }
                else if (drag_collision == BOUND_LEFT) // Left
                {
                    if ((level_bound_x2 - final_x) < 1920)
                        final_x = (level_bound_x2 - 1920);
                    with (obj_level_editor_background)
                        scr_draw_line_sprite(level_bound_x1, level_bound_y1, level_bound_x1, level_bound_y2, line_width_outline, c_white);
                    final_y = prev_final_y;
                    level_bound_x1 = final_x;
                }
                else if (drag_collision == BOUND_RIGHT) // Right
                {
                    if ((final_x - level_bound_x1) < 1920)
                        final_x = (level_bound_x1 + 1920);
                    with (obj_level_editor_background)
                        scr_draw_line_sprite(level_bound_x2, level_bound_y1, level_bound_x2, level_bound_y2, line_width_outline, c_white);
                    final_y = prev_final_y;
                    level_bound_x2 = final_x;
                }
                if (prev_final_x != final_x || prev_final_y != final_y)
                {
                    sound = audio_play_sound(sou_boink_b, 0.6, false);
                    audio_sound_gain(sound, 0.1, 0);
                    audio_sound_pitch(sound, (1 * (0.85 + random(0.3))));
                }
                prev_final_x = final_x;
                prev_final_y = final_y;
            }
            else if (drag_collision != noone && !variable_struct_exists(argument0, "li_objects_in_box")) // If we are dragging an object
            {
                final_x = global.cursor_in_level_x + drag_xoff;
                final_y = global.cursor_in_level_y + drag_yoff;
                var snap = round(variable_struct_get(argument0.tool_properties[1], "value") * 10);
                if (snap != 0)
                {
                    final_x = round(final_x / snap) * snap;
                    final_y = round(final_y / snap) * snap;
                }
                final_x = round(final_x);
                final_y = round(final_y);
                drag_collision.x = final_x;
                drag_collision.y = final_y;
                if (prev_final_x != final_x || prev_final_y != final_y)
                {
                    sound = audio_play_sound(sou_boink_b, 0.6, false);
                    audio_sound_gain(sound, 0.1, 0);
                    audio_sound_pitch(sound, 1 * (0.85 + random(0.3)));
                }
                prev_final_x = final_x;
                prev_final_y = final_y;
                hlp_draw_bounding_box_around_obj(drag_collision, 2, c_white, 0);
            }
        }
        if (variable_struct_exists(argument0, "li_objects_in_box"))
        {
            final_x = global.cursor_in_level_x + drag_xoff;
            final_y = global.cursor_in_level_y + drag_yoff;
            var snap = round(variable_struct_get(argument0.tool_properties[1], "value") * 10);
            
            if (prev_final_x != final_x || prev_final_y != final_y)
            {
                sound = audio_play_sound(sou_boink_b, 0.6, false);
                audio_sound_gain(sound, 0.1, 0);
                audio_sound_pitch(sound, 1 * (0.85 + random(0.3)));

                for (var i = 0; i < ds_list_size(argument0.li_objects_in_box); i++) 
                { 
                    var toMove = ds_list_find_value(argument0.li_objects_in_box, i);

                    toMove.x = final_x + ds_grid_get(argument0.cached_offsets, 0, i);
                    toMove.y = final_y + ds_grid_get(argument0.cached_offsets, 1, i);

                    if (snap != 0)
                    {
                        toMove.x = round(toMove.x / snap) * snap;
                        toMove.y = round(toMove.y / snap) * snap;
                    }
                    toMove.x = round(toMove.x);
                    toMove.y = round(toMove.y);
                }
            }
            prev_final_x = final_x;
            prev_final_y = final_y;
        }
        break;
    case END:
        if (is_undefined(drag_collision)) break;

        if (drag_collision != noone)
        {
            // If we arent dragging a level boundary
            if (drag_collision > BOUND_TOP)
            {
                level_bound_x1 = min(level_bound_x1, (round((global.cursor_in_level_x / 60)) * 60));
                level_bound_x2 = max(level_bound_x2, (round((global.cursor_in_level_x / 60)) * 60));
                level_bound_y1 = min(level_bound_y1, (round((global.cursor_in_level_y / 60)) * 60));
                level_bound_y2 = max(level_bound_y2, (round((global.cursor_in_level_y / 60)) * 60));
            }
            sound = audio_play_sound(sou_shooter_plop_01, 0.6, false);
            audio_sound_gain(sound, 0.3, 0);
            audio_sound_pitch(sound, 0.96);
        }
        break;

    case HOVER:
        // Check if we are hovering over a level object
        collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, obj_lvlobj_parent);
        if (collision != noone)
        {
            drag_current_toolstruct = collision.toolStruct;
            hlp_draw_bounding_box_around_obj(collision, 4, obj_levelstyler.col_td_turret_3);
        }
        else
        {
            // Final check if we are hovering over the level bounds
            with (obj_level_editor_background)
            {
                if point_in_rectangle(global.cursor_in_level_x, global.cursor_in_level_y, (level_bound_x1 - line_width_outline_div2), (level_bound_y1 - line_width_outline), (level_bound_x2 + line_width_outline_div2), (level_bound_y1 + line_width_outline))
                    scr_draw_line_sprite((level_bound_x1 - line_width_outline_div2), level_bound_y1, (level_bound_x2 + line_width_outline_div2), level_bound_y1, (line_width_outline + (sin((current_time / 100)) * 4)), obj_levelstyler.col_td_turret_3);
                else if point_in_rectangle(global.cursor_in_level_x, global.cursor_in_level_y, (level_bound_x1 - line_width_outline_div2), (level_bound_y2 - line_width_outline), (level_bound_x2 + line_width_outline_div2), (level_bound_y2 + line_width_outline))
                    scr_draw_line_sprite((level_bound_x1 - line_width_outline_div2), level_bound_y2, (level_bound_x2 + line_width_outline_div2), level_bound_y2, (line_width_outline + (sin((current_time / 100)) * 4)), obj_levelstyler.col_td_turret_3);
                else if point_in_rectangle(global.cursor_in_level_x, global.cursor_in_level_y, (level_bound_x1 - line_width_outline_div2), level_bound_y1, (level_bound_x1 + line_width_outline_div2), level_bound_y2)
                    scr_draw_line_sprite(level_bound_x1, level_bound_y1, level_bound_x1, level_bound_y2, (line_width_outline + (sin((current_time / 100)) * 4)), obj_levelstyler.col_td_turret_3);
                else if point_in_rectangle(global.cursor_in_level_x, global.cursor_in_level_y, (level_bound_x2 - line_width_outline_div2), level_bound_y1, (level_bound_x2 + line_width_outline_div2), level_bound_y2)
                    scr_draw_line_sprite(level_bound_x2, level_bound_y1, level_bound_x2, level_bound_y2, (line_width_outline + (sin((current_time / 100)) * 4)), obj_levelstyler.col_td_turret_3);
            }
        }

        if (keyboard_check_pressed(ord("R")))
        {
            if (variable_struct_exists(argument0, "li_objects_in_box"))
            {
                ds_list_destroy(argument0.li_objects_in_box);
                variable_struct_remove(argument0, "li_objects_in_box");
            }
            if (variable_struct_exists(argument0, "cached_offsets"))
            {
                ds_grid_destroy(argument0.cached_offsets);
                variable_struct_remove(argument0, "cached_offsets");
            } 
        }

        if (variable_struct_exists(argument0, "li_objects_in_box"))
        {
            if (ds_exists(argument0.li_objects_in_box, ds_type_list))
            {
                var bx1 = REAL_MAX; // Left
                var bx2 = REAL_MIN; // Right
                var by1 = REAL_MAX; // Top
                var by2 = REAL_MIN; // Bottom

                for (var i = 0; i < ds_list_size(argument0.li_objects_in_box); i++) 
                { 
                    var toDrag = ds_list_find_value(argument0.li_objects_in_box, i);

                    if (toDrag.x < bx1)
                        bx1 = toDrag.x;
                    if (toDrag.x + toDrag.image_xscale * 60 > bx2)
                        bx2 = toDrag.x + toDrag.image_xscale * 60;
                    if (toDrag.y < by1)
                        by1 = toDrag.y;
                    if (toDrag.y + toDrag.image_yscale * 60 > by2)
                        by2 = toDrag.y + toDrag.image_yscale * 60;
                }

                scr_draw_rectangle_border_fromto(min(bx1, bx2), min(by1, by2), max(bx1, bx2), max(by1, by2), 4, obj_levelstyler.col_td_turret_3);
            }
        }

        break;
}

return 1;
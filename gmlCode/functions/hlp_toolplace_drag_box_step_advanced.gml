
var grid_xscale = argument6
var grid_yscale = argument7

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
mouse_drag_box_current_x = floor(((global.cursor_in_level_x - xoffseet) / grid_xscale))
mouse_drag_box_current_y = floor(((global.cursor_in_level_y - yoffseet) / grid_yscale))
mouse_drag_boxes = ((abs((mouse_drag_box_current_x - mouse_drag_box_start_x)) + abs((mouse_drag_box_current_y - mouse_drag_box_start_y))) + 1)
if ((mouse_drag_boxes != mouse_drag_boxes_last))
{
    sound = audio_play_sound(argument3, 0.6, false)
    audio_sound_gain(sound, argument5, 0)
    audio_sound_pitch(sound, (argument4 * power(1.025, mouse_drag_boxes)))
}
mouse_drag_boxes_last = mouse_drag_boxes
mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * grid_xscale)
mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * grid_xscale) + grid_xscale)
mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * grid_yscale)
mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * grid_yscale) + grid_yscale)
mouse_crag_box_draw_x1 = lerp(mouse_crag_box_draw_x1, mouse_drag_box_xmin, 0.6)
mouse_crag_box_draw_y1 = lerp(mouse_crag_box_draw_y1, mouse_drag_box_ymin, 0.6)
mouse_crag_box_draw_x2 = lerp(mouse_crag_box_draw_x2, mouse_drag_box_xmax, 0.6)
mouse_crag_box_draw_y2 = lerp(mouse_crag_box_draw_y2, mouse_drag_box_ymax, 0.6)
scr_draw_rectangle_border_fromto((mouse_crag_box_draw_x1 + xoffseet), (mouse_crag_box_draw_y1 + yoffseet), (mouse_crag_box_draw_x2 + xoffseet), (mouse_crag_box_draw_y2 + yoffseet), argument1, argument2)
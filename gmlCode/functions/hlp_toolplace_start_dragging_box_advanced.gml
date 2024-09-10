show_debug_message("hlp_toolplace_start_dragging_box_advanced")

var grid_xscale = argument1
var grid_yscale = argument2

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
mouse_drag_box_start_x = floor(((global.cursor_in_level_x - xoffseet) / grid_xscale))
mouse_drag_box_start_y = floor(((global.cursor_in_level_y - yoffseet) / grid_yscale))
mouse_drag_box_current_x = mouse_drag_box_start_x
mouse_drag_box_current_y = mouse_drag_box_start_y
mouse_crag_box_draw_x1 = (mouse_drag_box_start_x * grid_xscale)
mouse_crag_box_draw_y1 = (mouse_drag_box_start_y * grid_yscale)
mouse_crag_box_draw_x2 = ((mouse_drag_box_start_x * grid_xscale) + grid_xscale)
mouse_crag_box_draw_y2 = ((mouse_drag_box_start_y * grid_yscale) + grid_yscale)
mouse_drag_boxes_last = 0

var xscale_multp = argument9
var yscale_multp = argument10
var grid_xscale = argument11
var grid_yscale = argument12
var wall_snapping = argument13
var wallsnap_grid_xscale = 60
if(wall_snapping == 2) wallsnap_grid_xscale = grid_xscale
var wallsnap_grid_yscale = 60
if(wall_snapping == 2) wallsnap_grid_yscale = grid_yscale

var obj_offset_x = argument2 - argument0
var obj_offset_y = argument3 - argument1
var cur_tool_id = argument5.custom_tool_or_object_id
var sprite_offset_x = (sprite_get_xoffset(argument5.preview_sprite_index_once_placed) + argument5.placement_offset_x)
var sprite_offset_y = (sprite_get_yoffset(argument5.preview_sprite_index_once_placed) + argument5.placement_offset_y)
var rotated_stuff = scr_rotate_pos_around_point(argument0, argument1, argument2, argument3, argument4)
var return_x = ((round(rotated_stuff[0]) + argument7) - obj_offset_x + obj_offset_x * xscale_multp)
var return_y = ((round(rotated_stuff[1]) + argument8) - obj_offset_y + obj_offset_y * yscale_multp)
if (!(ds_map_exists(argument5.ds_map_tool_properties, "xoff")))
{
    return_x = (return_x - (argument7 % grid_xscale))
    return_y = (return_y - (argument8 % grid_yscale))
}
var return_scale_x = argument6.scaleX * xscale_multp
var return_scale_y = argument6.scaleY * yscale_multp
var return_angle = argument6.angle
var rot_property = ds_map_find_value(argument5.ds_map_tool_properties, "rot")
if (!is_undefined(rot_property))
{
    return_angle += argument4
    return_angle = (round((return_angle / rot_property.f_scroll_steps)) * rot_property.f_scroll_steps)
    return_angle = (return_angle % 360)
}
else if ((argument5.placement_script == gml_Script_toolplace_fill_with_wall_blocks) && wall_snapping)
{
    switch ((round((argument4 / 90)) * 90) % 360)
    {
        case 0:
            break
        case 90:
            return_scale_x = argument6.scaleY * xscale_multp
            return_scale_y = argument6.scaleX * yscale_multp
            return_y -= (return_scale_y * wallsnap_grid_yscale)
            break
        case 180:
            return_x -= (return_scale_x * wallsnap_grid_xscale)
            return_y -= (return_scale_y * wallsnap_grid_yscale)
            break
        case 270:
            return_scale_x = argument6.scaleY * xscale_multp
            return_scale_y = argument6.scaleX * yscale_multp
            return_x -= (return_scale_x * wallsnap_grid_xscale)
            break
        default:
            break
    }

} else if (!wall_snapping){
    return_angle += argument4
}
var to_return = [
    "x", return_x,
    "y", return_y,
    "image_xscale", return_scale_x,
    "image_yscale", return_scale_y,
    "image_angle", return_angle
]
return gml_Script_shellworks_modhelper_array_to_struct(to_return)
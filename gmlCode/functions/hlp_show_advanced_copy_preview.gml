
var x_pos = argument0
var y_pos = argument1
var object = argument2
var angle = argument3
var x_off = argument4
var y_off = argument5
var xscale_multp = argument6
var yscale_multp = argument7
var grid_xscale = argument8
var grid_yscale = argument9
var wall_snapping = argument10
var wallsnap_grid_xscale = 60
if(wall_snapping == 2) wallsnap_grid_xscale = grid_xscale
var wallsnap_grid_yscale = 60
if(wall_snapping == 2) wallsnap_grid_yscale = grid_yscale

var _toolStruct = argument2.toolStruct
var rot_data = gml_Script_hlp_advanced_rotate_object_data(argument0, argument1, (argument0 + argument2.x), (argument1 + argument2.y), argument3, argument2.toolStruct, argument2, argument4, argument5, xscale_multp, yscale_multp, grid_xscale, grid_yscale, wall_snapping)
created_inst_x = rot_data.x
created_inst_y = rot_data.y
quicktool_sprite = get_tool_sprite(_toolStruct)
img_angle = rot_data.image_angle
img_xscale = rot_data.image_xscale
img_yscale = rot_data.image_yscale
sprite_preview_color = _toolStruct.preview_color
tool_id = _toolStruct.custom_tool_or_object_id
alphana = ((sin((current_time / 100)) * 0.3) + 0.7)
if ((_toolStruct.placement_script == gml_Script_toolplace_fill_with_wall_blocks) && wall_snapping)
{
    var tex = ds_map_find_value(argument2.properties, "tex")
    if ((tex != undefined))
        quicktool_sprite = script_execute(ds_map_find_value(_toolStruct.ds_map_tool_properties, "tex").array_sprite_picking_functions[tex], true)
}
if ((_toolStruct.custom_tool_or_object_id == "td_turret"))
{
    var tower = ds_map_find_value(argument2.properties, "turret_type")
    if ((tower != undefined))
    {
        switch tower
        {
            case 0:
                quicktool_sprite = spr_td_turret_basic
                break
            case 1:
                quicktool_sprite = spr_td_turret_spash
                break
            case 2:
                quicktool_sprite = spr_td_turret_sniper
                break
            default:
                quicktool_sprite = spr_td_turret_basic
        }

    }
}
preview_sprite_index_once_placed = quicktool_sprite
if variable_struct_exists(_toolStruct, "custom_draw")
{
    switch _toolStruct.custom_tool_or_object_id
    {
        case "path_tool":
            break
        default:
            _toolStruct.custom_draw(_toolStruct, alphana)
            break
    }

}
else
{
    switch _toolStruct.custom_tool_or_object_id
    {
        case "door":
            preview_sprite_index_once_placed = spr_door2
            hlp_draw_regular_sprite(_toolStruct, alphana)
            break
        default:
            hlp_draw_regular_sprite(_toolStruct, alphana)
            break
    }

}
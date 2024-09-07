var selected = argument0
if(instance_exists(argument0)){
    var toolStruct = selected.toolStruct
    if(!keyboard_check(vk_lalt)){
        if(scr_array_has(global.database_snapped_grid_objects, toolStruct.custom_tool_or_object_id)){
            if(selected.sprite_width % 60 == 0 && selected.sprite_height % 60 == 0){
                return #orig#(argument0, argument1, argument2, argument3, argument4)
            } else {
                instance_destroy(selected)
            }
        } else {
            return #orig#(argument0, argument1, argument2, argument3, argument4)
        }
    }
}
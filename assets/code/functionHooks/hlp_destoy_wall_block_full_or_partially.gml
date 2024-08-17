if(variable_instance_exists(id, "li_objects_in_box")){
    if(ds_exists(li_objects_in_box, ds_type_list)){
        return #orig#(argument0, argument1, argument2, argument3, argument4)
    }
}


if(!keyboard_check(vk_lalt)){
    var selected = argument0
    if(instance_exists(argument0)){
        if(object_is_ancestor(selected.object_index, obj_wall)){
            if(selected.is_wall_like && selected.is_wall){
                if((selected.sprite_width % 60 == 0 && selected.sprite_height % 60 == 0)){
                    return #orig#(argument0, argument1, argument2, argument3, argument4)
                } else {
                    instance_destroy(selected)
                }
            }
        } else {
            return #orig#(argument0, argument1, argument2, argument3, argument4)
        }
    } else {
        return #orig#(argument0, argument1, argument2, argument3, argument4)
    }
}
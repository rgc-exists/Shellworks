if(room == menu || room = main_menu_dark || room == community_campaign_lvlselect || room == level_select || room == level_select_side || room == bonus_hat_room || room == RoomOfHats || room == disclaimer_photoepilepsy || room == performance_check || room == level_editor){
    return false
}


if(variable_global_exists("checkpoint")){
    if(global.checkpoint != undefined){
        var old_saved_instances = variable_struct_get(global.checkpoint, "saved_instances")
        var old_copied_instances = variable_struct_get(global.checkpoint, "copied_instances")

        for(var i = 0; i < array_length(old_saved_instances); i++){
            instance_destroy(old_saved_instances[i], false)
        }
    }
}

var saved_instances = []
var copied_instances = []
for(var obj = 0; obj < 10000; obj++){
    if(!object_exists(obj))
        break;
    var is_excluded = false
    for(var i = 0; i < array_length(global.checkpoints_objects_to_exclude); i++){
        var obj2 = global.checkpoints_objects_to_exclude[i]
        if(object_is_ancestor(obj2, obj) || obj2 == obj)
            is_excluded = true
            break;
    }
    if(is_excluded)
        continue;
    with(obj){
        var new_inst = instance_copy(false)
        array_push(copied_instances, new_inst)
        
        array_push(saved_instances, id)
        instance_deactivate_object(id)
    }
}
with(all){
    var names = variable_instance_get_names(id)
    for(var n = 0; n < array_length(names); n++){
        var cur_name = names[n]
        var cur_value = variable_instance_get(id, cur_name)
        if(typeof(cur_value) == typeof(id)){
            if(gml_Script_shellworks_array_contains(saved_instances, cur_value)){
                //show_debug_message("found " + cur_name + " as " + string(cur_value) + ", converting to new instance id")
                    
                variable_instance_set(id, cur_name, copied_instances[gml_Script_shellworks_array_get_index(saved_instances, cur_value)])
            }
        }
    }
}

var checkpoint_struct_array = [
    "saved_instances", saved_instances,
    "copied_instances", copied_instances
]
global.checkpoint = gml_Script_shellworks_modhelper_array_to_struct(checkpoint_struct_array)


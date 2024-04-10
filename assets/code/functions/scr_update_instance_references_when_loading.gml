var object_to_update =  argument0
var saved_instances = argument1 
var copied_instances = argument2
with(object_to_update){
    show_debug_message("Changing references in " + object_get_name(object_index))
    var names = variable_instance_get_names(id)
    for(var n = 0; n < array_length(names); n++){
        var cur_name = names[n]
        var cur_value = variable_instance_get(id, cur_name)
        if(typeof(cur_value) == typeof(id)){
            if(gml_Script_shellworks_array_contains(copied_instances, cur_value)){
                show_debug_message("found " + cur_name + " as " + string(cur_value) + ", converting to new instance id")
                variable_instance_set(id, cur_name, saved_instances[gml_Script_shellworks_array_get_index(copied_instances, cur_value)])
            }
        }
    }
}
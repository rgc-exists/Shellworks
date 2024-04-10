if(variable_global_exists("checkpoint")){
    if(global.checkpoint != undefined){
        var saved_instances = variable_struct_get(global.checkpoint, "saved_instances")
        var copied_instances = variable_struct_get(global.checkpoint, "copied_instances")
        var new_copied_instances = []
        show_debug_message(array_length(saved_instances))
        show_debug_message(array_length(copied_instances))
        for(var i = 0; i < array_length(saved_instances); i++){
            instance_activate_object(saved_instances[i])
            instance_destroy(copied_instances[i], false)
        }

        var checkpoint_struct_array = [
            "saved_instances", saved_instances,
            "copied_instances", new_copied_instances
        ]
        global.checkpoint = gml_Script_shellworks_modhelper_array_to_struct(checkpoint_struct_array)
        global.just_loaded_savestate = true
    }
}


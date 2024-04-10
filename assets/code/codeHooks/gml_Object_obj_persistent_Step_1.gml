if(global.just_loaded_savestate){
    var saved_instances = variable_struct_get(global.checkpoint, "saved_instances")
    var copied_instances = variable_struct_get(global.checkpoint, "copied_instances")
    var new_copied_instances = []
    for(var i = 0; i < array_length(saved_instances); i++){
        with(saved_instances[i]){
            var new_inst = instance_copy(false)
            array_push(new_copied_instances, new_inst)
            instance_activate_object(id)
        }
    }


    with(all){
        gml_Script_scr_update_instance_references_when_loading(id, saved_instances, copied_instances)
    }


    var checkpoint_struct_array = [
        "saved_instances", saved_instances,
        "copied_instances", new_copied_instances
    ]
    global.checkpoint = gml_Script_shellworks_modhelper_array_to_struct(checkpoint_struct_array)

}

#orig#()
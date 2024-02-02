if (variable_global_exists("li_level_editor_database_backup")){
    if(ds_exists(global.li_level_editor_database_backup, ds_type_list)){
        ds_list_destroy(global.li_level_editor_database_backup)
    }
}
global.li_level_editor_database_backup = ds_list_create()
ds_list_copy(global.li_level_editor_database_backup, global.li_level_editor_database)
for(var i = 0; i < array_length(global.dont_save_these_objects); i++){
    for(var o = 0; o < ds_list_size(global.li_level_editor_database); o++){
        var curDatabaseStruct = ds_list_find_value(global.li_level_editor_database, o)
        if( curDatabaseStruct.custom_tool_or_object_id == global.dont_save_these_objects[i]){
            ds_list_delete(global.li_level_editor_database, o)
        }
    }
}

for(var i = 0; i < ds_list_size(obj_level_editor.li_quicktool_slots); i++){
    var curDatabaseStruct = ds_list_find_value(obj_level_editor.li_quicktool_slots, i)
    for(var o = 0; o < array_length(global.dont_save_these_objects); o++){
        if(global.dont_save_these_objects[o] == curDatabaseStruct.custom_tool_or_object_id){
            ds_list_replace(obj_level_editor.li_quicktool_slots, i, get_leveleditor_database_element("wall"))
        }
    }
}

var return_value = #orig#()

ds_list_clear(global.li_level_editor_database)
ds_list_copy(global.li_level_editor_database, global.li_level_editor_database_backup)

return return_value
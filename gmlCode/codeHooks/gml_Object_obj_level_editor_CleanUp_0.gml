
for(var li = 0; li < ds_list_size(global.li_level_editor_database); li++){
    dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
    if(dataBaseStruct.custom_tool_or_object_id == "advanced_copy_tool"){
        repeat(10) show_debug_message("Found advanced_copy_tool")

        global.adv_copyTool_toolProps = modhelper_create_struct()

        for (ti = 0; ti < array_length(dataBaseStruct.tool_properties); ti++)
        {
            thsToolProp = dataBaseStruct.tool_properties[ti]
            show_debug_message("Setting " + string(thsToolProp.key) + " to " + string(thsToolProp.value))
            variable_struct_set(global.adv_copyTool_toolProps, thsToolProp.key, thsToolProp.value)
        }
    }
}

#orig#()


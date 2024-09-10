#orig#()

if (!variable_global_exists("li_level_editor_database") || !variable_global_exists("adv_copyTool_toolProps"))
    return;
for (var iprp = 0; iprp < ds_list_size(global.li_level_editor_database); iprp++)
{
    var lvleditor_database_element = ds_list_find_value(global.li_level_editor_database, iprp)
    if(lvleditor_database_element.custom_tool_or_object_id == "advanced_copy_tool"){
        var k = ds_map_find_first(lvleditor_database_element.ds_map_tool_properties)
        while (!is_undefined(k))
        {
            var v = ds_map_find_value(lvleditor_database_element.ds_map_tool_properties, k)
            v.value = variable_struct_get(global.adv_copyTool_toolProps, k)
            if ((v.key == "rot"))
                lvleditor_database_element.image_angle = v.value
            ds_map_set(lvleditor_database_element.ds_map_tool_properties, k, v)
            k = ds_map_find_next(lvleditor_database_element.ds_map_tool_properties, k)
        }
    }
}
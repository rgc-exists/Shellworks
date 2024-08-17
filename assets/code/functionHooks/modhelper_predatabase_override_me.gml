#orig#()


copy_tool = -1
for(var o = 0; o < ds_list_size(global.li_level_editor_database); o += 1){
    copy_tool = ds_list_find_value(global.li_level_editor_database, o)
    if(variable_struct_get(copy_tool, "custom_tool_or_object_id") == "copy_tool"){
        break
    }
}

names = variable_struct_get_names(copy_tool)

copy_tool_copy_2 = modhelper_create_struct()

for(var i = 0; i < variable_struct_names_count(copy_tool); i += 1){
    variable_struct_set(copy_tool_copy_2, names[i], variable_struct_get(copy_tool, names[i]))
}

variable_struct_set(copy_tool_copy_2, "custom_tool_or_object_id", "inspector_tool")
variable_struct_set(copy_tool_copy_2, "preview_color", "col_snail")
variable_struct_set(copy_tool_copy_2, "preview_sprite_index", global.inspector_tool_sprite)
variable_struct_set(copy_tool_copy_2, "placement_script", gml_Script_scr_inspector_select_blocks_in_rect)
variable_struct_set(copy_tool_copy_2, "deletion_script", gml_Script_toolplace_nothing_happens)
var toolProps = [modhelper_createprop_help("hlp", "editor_prop_info", spr_propico_help, "inspector_tool_help")]
variable_struct_set(copy_tool_copy_2, "tool_properties", toolProps)

ds_list_add(global.li_level_editor_database, copy_tool_copy_2)

copy_tool_copy_3 = modhelper_create_struct()

for(var i = 0; i < variable_struct_names_count(copy_tool); i += 1){
    variable_struct_set(copy_tool_copy_3, names[i], variable_struct_get(copy_tool, names[i]))
}

variable_struct_set(copy_tool_copy_3, "custom_tool_or_object_id", "ruler_tool")
variable_struct_set(copy_tool_copy_3, "preview_color", "col_bubbles")
variable_struct_set(copy_tool_copy_3, "preview_sprite_index", global.ruler_tool_sprite)
variable_struct_set(copy_tool_copy_3, "placement_script", gml_Script_scr_rulertool_display_length_inBlocks)
variable_struct_set(copy_tool_copy_3, "deletion_script", gml_Script_scr_rulertool_display_length_inBlocks)
var toolProps = [modhelper_createprop_help("hlp", "editor_prop_info", spr_propico_help, "ruler_tool_help")]
variable_struct_set(copy_tool_copy_3, "tool_properties", toolProps)

ds_list_add(global.li_level_editor_database, copy_tool_copy_3)









global.dont_save_these_objects = ["inspector_tool", "ruler_tool"]


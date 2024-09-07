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


copy_tool_copy_4 = modhelper_create_struct()

for(var i = 0; i < variable_struct_names_count(copy_tool); i += 1){
    variable_struct_set(copy_tool_copy_4, names[i], variable_struct_get(copy_tool, names[i]))
}

variable_struct_set(copy_tool_copy_4, "custom_tool_or_object_id", "advanced_copy_tool")
variable_struct_set(copy_tool_copy_4, "preview_color", "col_spike_warning")
variable_struct_set(copy_tool_copy_4, "placement_script", gml_Script_toolplace_advanced_copy_paste)
var toolProps = [
    modhelper_createprop_help("hlp", "editor_prop_info", spr_propico_help, "advanced_copy_tool_help"),
    modhelper_createprop_int("copyxoff", false, -120, 120, "editor_prop_xoff", spr_propico_global, 0, "editor_prop_xoff_copy_tip"),
    modhelper_createprop_int("copyyoff", false, -120, 120, "editor_prop_yoff", spr_propico_global, 0, "editor_prop_yoff_copy_tip"),
    modhelper_createprop_float("advcopy_xscale", false, -15, 15, 0.05, 1,
    "editor_prop_xscale", spr_propico_global, 1, "editor_prop_xscale_tip"),
    modhelper_createprop_float("advcopy_yscale", false, -15, 15, 0.05, 1,
    "editor_prop_yscale", spr_propico_global, 1, "editor_prop_yscale_tip"),
    modhelper_createprop_rotation(),
    modhelper_createprop_float("grid_width", false, 1, 1200, 1, 0.01666666,
    "advanced_copy_tool_gridW", spr_propico_global, 60, "advanced_copy_tool_gridW_tip"),
    modhelper_createprop_float("grid_height", false, 1, 1200, 1, 0.01666666,
    "advanced_copy_tool_gridH", spr_propico_global, 60, "advanced_copy_tool_gridH_tip"),
    modhelper_createprop_int_as_string("wall_snapping", true, "advanced_copy_tool_wall_snapping", spr_propico_global,
    1, "advanced_copy_tool_wall_snapping_tip", ["wall_snapping_none", "wall_snapping_normal", "wall_snapping_scaleable"]),
    modhelper_createprop_int_as_string("pl_dorng", false, "editor_prop_rng_place", spr_propico_tool, 0, "editor_prop_rng_place_tip", ["editor_prop_opt_disabled", "editor_prop_opt_enabled"]),
    modhelper_createprop_float("randomX_min", false, -360, 360, 1, 0.01666666, "random_offset_x_min", spr_propico_global, 0, "random_offset_tip"),
    modhelper_createprop_float("randomX_max", false, -360, 360, 1, 0.01666666, "random_offset_x_max", spr_propico_global, 0, "random_offset_tip"),
    modhelper_createprop_float("randomY_min", false, -360, 360, 1, 0.01666666, "random_offset_y_min", spr_propico_global, 0, "random_offset_tip"),
    modhelper_createprop_float("randomY_max", false, -360, 360, 1, 0.01666666, "random_offset_y_max", spr_propico_global, 0, "random_offset_tip")

]
variable_struct_set(copy_tool_copy_4, "tool_properties", toolProps)

ds_list_add(global.li_level_editor_database, copy_tool_copy_4)










global.dont_save_these_objects = ["inspector_tool", "ruler_tool", "advanced_copy_tool"]

show_message("Sorry, the models tool is temporarily broken for now.\nYou can still copy objects between levels with the copy tool.")

selected_index = 4
quicktool_element = ds_list_find_value(global.li_level_editor_database, selected_index)
ds_list_replace(obj_level_editor.li_quicktool_slots, obj_level_editor.selected_quicktool_slot, quicktool_element)
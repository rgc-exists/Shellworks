if(file_exists("Shellworks_Keybinds.sav")){
    file = file_text_open_read("Shellworks_Keybinds.sav")
    current_input_action = -1
    next_is_trigger = 1
    list_of_actions_to_avoid_doubles = ds_list_create()
    while (!file_text_eof(file))
    {
        ln_text = file_text_read_string(file)
        file_text_readln(file)
        if (ln_text == "")
        {
        }
        else if (string_digits(ln_text) == ln_text || string_length(string_digits(ln_text)) == (string_length(ln_text) - 1))
        {
            if (current_input_action != -1)
            {
                ln_nr = real(ln_text)
                if (ln_nr == 160)
                {
                    show_debug_message("Found unsupported left shift button, changing to standard shift.")
                    ln_nr = 16
                }
                if next_is_trigger
                    ds_list_add(current_input_action.li_triggers, ln_nr)
                else
                    ds_list_add(current_input_action.li_trigger_types, ln_nr)
                next_is_trigger = (!next_is_trigger)
            }
        }
        else
        {
            current_input_action = -1
            kbin = 0
            while (kbin < ds_list_size(global.all_input_actions))
            {
                iact = ds_list_find_value(global.all_input_actions, kbin)
                if (iact.locaString == ln_text)
                {
                    if (ds_list_find_index(list_of_actions_to_avoid_doubles, ln_text) == -1)
                    {
                        ds_list_add(list_of_actions_to_avoid_doubles, ln_text)
                        current_input_action = iact
                        next_is_trigger = 1
                        ds_list_clear(current_input_action.li_triggers)
                        ds_list_clear(current_input_action.li_trigger_types)
                        break
                    }
                    else
                    {
                        kbin++
                        continue
                    }
                }
                else
                {
                    kbin++
                    continue
                }
            }
        }
    }
    ds_list_destroy(list_of_actions_to_avoid_doubles)
    file_text_close(file)
    lists_are_the_same = 0
    li1 = global.inputaction_lvled_tool_selection.li_triggers
    li2 = global.inputaction_lvled_tool_selection.li_trigger_types
    li1b = global.inputaction_lvled_tool_settings.li_triggers
    li2b = global.inputaction_lvled_tool_settings.li_trigger_types
    if (ds_list_size(li1) == ds_list_size(li1b))
    {
        if (ds_list_size(li2) == ds_list_size(li2b))
        {
            lists_are_the_same = 1
            for (i = 0; i < ds_list_size(li1); i++)
            {
                if (ds_list_find_value(li1, i) != ds_list_find_value(li1b, i))
                    lists_are_the_same = 0
            }
            for (i = 0; i < ds_list_size(li2); i++)
            {
                if (ds_list_find_value(li2, i) != ds_list_find_value(li2b, i))
                    lists_are_the_same = 0
            }
        }
    }
}
if (file_exists("Keybinds.sav"))
    return #orig#()
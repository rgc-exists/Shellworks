file = file_text_open_write("Keybinds.sav")
shellworks_file = file_text_open_write("Shellworks_Keybinds.sav")

for (kbin = 0; kbin < ds_list_size(global.all_input_actions); kbin++)
{
    iact = ds_list_find_value(global.all_input_actions, kbin)
    if(iact.locaString == "inputaction_shellworks_openmenu"){
        file_text_write_string(shellworks_file, iact.locaString)
        file_text_writeln(shellworks_file)
        for (iiii = 0; iiii < ds_list_size(iact.li_triggers); iiii++)
        {
            file_text_write_string(shellworks_file, ds_list_find_value(iact.li_triggers, iiii))
            file_text_writeln(shellworks_file)
            file_text_write_string(shellworks_file, ds_list_find_value(iact.li_trigger_types, iiii))
            file_text_writeln(shellworks_file)
        }
        file_text_writeln(shellworks_file)

    } else {

        file_text_write_string(file, iact.locaString)
        file_text_writeln(file)
        for (iiii = 0; iiii < ds_list_size(iact.li_triggers); iiii++)
        {
            file_text_write_string(file, ds_list_find_value(iact.li_triggers, iiii))
            file_text_writeln(file)
            file_text_write_string(file, ds_list_find_value(iact.li_trigger_types, iiii))
            file_text_writeln(file)
        }
        file_text_writeln(file)
    }
}
file_text_close(file)
file_text_close(shellworks_file)
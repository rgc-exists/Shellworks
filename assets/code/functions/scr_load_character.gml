var character_save_path = get_open_filename_ext("WYS Character File | *.wyschar", "MyFirstCharacter.wyschar", "", "Choose a place to save your character.")
if(character_save_path != ""){
    var file = file_text_open_read(character_save_path)
    var charFile_version = file_text_read_string(file)
    file_text_readln(file)
    file_text_readln(file)
    while(!file_text_eof(file)){
        var varName = file_text_read_string(file)
        file_text_readln(file)
        switch varName {
            case "Body":
                global.setting_player_body = file_text_read_real(file)
                break;
            case "Shell":
                global.setting_player_shell = file_text_read_real(file)
                break;
            case "Outline":
                global.setting_player_outline = file_text_read_real(file)
                break;
            case "Eyes":
                global.setting_player_eye = file_text_read_real(file)
                break;
            case "Death":
                global.setting_player_death = file_text_read_real(file)
                break;
            case "Spotlight":
                global.setting_player_spotlight = file_text_read_real(file)
                break;
            case "Spotlight Dark":
                global.setting_player_spotlight_dark = file_text_read_real(file)
                break;
            case "Flare":
                global.setting_player_flare = file_text_read_real(file)
                break;
            case "Trail":
                global.setting_player_trail = file_text_read_real(file)
                break;
            case "Hat":
                global.save_equipped_hat = file_text_read_real(file)
                global.setting_default_hat = file_text_read_real(file)
                break;
        }
        file_text_readln(file)
    }

    file_text_close(file)

    gml_Script_scr_revert_selected_player_colors()
    
    scr_save_settings()
    obj_persistent.should_restart_after_exit_menu = true
}
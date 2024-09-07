var character_save_path = get_save_filename_ext("WYS Character File | *.wyschar", "MyFirstCharacter.wyschar", "", "Choose a place to save your character.")
if(character_save_path != ""){
    var file = file_text_open_write(character_save_path)
    var charFile_version = "0.0.1"
    file_text_write_string(file, charFile_version)
    file_text_writeln(file)
    file_text_writeln(file)


    file_text_write_string(file, "Body")
    file_text_writeln(file)
    toWrite = global.setting_player_body
    if(is_undefined(toWrite)){
        toWrite = -1
    }
    file_text_write_real(file, toWrite)
    file_text_writeln(file)
    file_text_write_string(file, "Shell")
    file_text_writeln(file)
    toWrite = global.setting_player_shell
    if(is_undefined(toWrite)){
        toWrite = -1
    }
    file_text_write_real(file, toWrite)
    file_text_writeln(file)
    file_text_write_string(file, "Outline")
    file_text_writeln(file)
    toWrite = global.setting_player_outline
    if(is_undefined(toWrite)){
        toWrite = -1
    }
    file_text_write_real(file, toWrite)
    file_text_writeln(file)
    file_text_write_string(file, "Eyes")
    file_text_writeln(file)
    toWrite = global.setting_player_eye
    if(is_undefined(toWrite)){
        toWrite = -1
    }
    file_text_write_real(file, toWrite)
    file_text_writeln(file)
    file_text_write_string(file, "Death")
    file_text_writeln(file)
    toWrite = global.setting_player_death
    if(is_undefined(toWrite)){
        toWrite = -1
    }
    file_text_write_real(file, toWrite)
    file_text_writeln(file)
    file_text_write_string(file, "Spotlight")
    file_text_writeln(file)
    toWrite = global.setting_player_spotlight
    if(is_undefined(toWrite)){
        toWrite = -1
    }
    file_text_write_real(file, toWrite)
    file_text_writeln(file)
    file_text_write_string(file, "Spotlight Dark")
    file_text_writeln(file)
    toWrite = global.setting_player_spotlight_dark
    if(is_undefined(toWrite)){
        toWrite = -1
    }
    file_text_write_real(file, toWrite)
    file_text_writeln(file)
    file_text_write_string(file, "Flare")
    file_text_writeln(file)
    toWrite = global.setting_player_flare
    if(is_undefined(toWrite)){
        toWrite = -1
    }
    file_text_write_real(file, toWrite)
    file_text_writeln(file)
    file_text_write_string(file, "Trail")
    file_text_writeln(file)
    toWrite = global.setting_player_trail
    if(is_undefined(toWrite)){
        toWrite = -1
    }
    file_text_write_real(file, toWrite)
    file_text_writeln(file)
    file_text_write_string(file, "Hat")
    file_text_writeln(file)
    toWrite = global.save_equipped_hat
    if(is_undefined(toWrite)){
        toWrite = -1
    }
    file_text_write_real(file, toWrite)
    file_text_writeln(file)

    file_text_close(file)
}
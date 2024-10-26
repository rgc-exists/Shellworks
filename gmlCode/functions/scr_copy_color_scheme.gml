var scheme = argument0
var copy_overrides = argument1
var custom_path = argument2
var out_path = argument3

if(is_undefined(copy_overrides)) copy_overrides = false

if(is_undefined(custom_path) || !custom_path){
    scheme_path = "Colors/" + string(scheme) + "/"
} else {
    if(string_ends_with(scheme, "/") || string_ends_with(scheme, "\\"))
        scheme_path = string(scheme)
    else
        scheme_path = string(scheme) + "/"
}


var max_scheme = 1
output_path = "Colors/" + string(max_scheme) + "/"
while(directory_exists(output_path)){
    max_scheme += 1
    output_path = "Colors/" + string(max_scheme) + "/"
}

var old_scheme_directory = "Colors/" + string(scheme) + "/"
var new_scheme_directory = "Colors/" + string(max_scheme) + "/"
if(!is_undefined(custom_path) && custom_path){
    old_scheme_directory = scheme_path
}
if(!is_undefined(out_path)){
    new_scheme_directory = out_path
}

directory_create("Colors")
directory_create(new_scheme_directory)
directory_create(new_scheme_directory + "Overrides")

file_copy(old_scheme_directory + "Normal.txt", new_scheme_directory + "Normal.txt")
file_copy(old_scheme_directory + "Disco.txt", new_scheme_directory + "Disco.txt")
file_copy(old_scheme_directory + "Underwater.txt", new_scheme_directory + "Underwater.txt")
file_copy(old_scheme_directory + "Bubblegum.txt", new_scheme_directory + "Bubblegum.txt")
file_copy(old_scheme_directory + "Winter.txt", new_scheme_directory + "Winter.txt")
file_copy(old_scheme_directory + "Brain.txt", new_scheme_directory + "Brain.txt")
file_copy(old_scheme_directory + "Preview.png", new_scheme_directory + "Preview.png")

if(copy_overrides){
    var file_name = file_find_first(old_scheme_directory + "Overrides/", fa_none)
    while(file_name != ""){
        file_copy(old_scheme_directory + "Overrides/" + file_name, new_scheme_directory + "Overrides/" + file_name)
        file_name = file_find_next()
    }
    file_find_close()
}

if(is_undefined(out_path)){
    global.setting_color_scheme = max_scheme

    global.just_copied_color_scheme = 2
    global.levelstyler_colors_need_to_be_reloaded = true
}


if(room == level_editor_play_mode){
    global.levelstyler_colors_need_to_be_reloaded = true
    //with(obj_levelstyler) color_scheme_backup = -1
    leveleditor_play_current_level(false)
} else if(room != level_editor /* && room != level_editor_play_mode */ && room != menu && room != main_menu_dark){
    //with(obj_levelstyler) color_scheme_backup = -1
    room_restart()
}
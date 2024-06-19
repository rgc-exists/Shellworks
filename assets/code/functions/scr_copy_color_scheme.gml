var scheme = argument0

scheme_path = "Colors/" + string(scheme) + "/"

var max_scheme = 1
output_path = "Colors/" + string(max_scheme) + "/"
while(directory_exists(output_path)){
    max_scheme += 1
    output_path = "Colors/" + string(max_scheme) + "/"
}

var old_scheme_directory = "Colors/" + string(scheme) + "/"
var new_scheme_directory = "Colors/" + string(max_scheme) + "/"

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

/*
var file_name = file_find_first(old_scheme_directory + "Overrides/", 0)

while(file_name != ""){
    file_copy(old_scheme_directory + "Overrides/" + file_name, new_scheme_directory + "Overrides/" + file_name)

    file_name = file_find_next()
}

file_find_close()
*/

global.setting_color_scheme = max_scheme

global.just_copied_color_scheme = 2
global.levelstyler_colors_need_to_be_reloaded = true
if(room == level_editor_play_mode){
    global.levelstyler_colors_need_to_be_reloaded = true
    //with(obj_levelstyler) color_scheme_backup = -1
    leveleditor_play_current_level(false)
} else if(room != level_editor /* && room != level_editor_play_mode */ && room != menu && room != main_menu_dark){
    //with(obj_levelstyler) color_scheme_backup = -1
    room_restart()
}


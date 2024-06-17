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
file_copy(old_scheme_directory + "Preview.png", new_scheme_directory + "Brain.txt")

var file_name = file_find_first(old_scheme_directory + "Overrides/", 0)

while(file_name != ""){
    file_copy(old_scheme_directory + "Overrides/" + file_name, new_scheme_directory + "Overrides/" + file_name)

    file_name = file_find_next()
}

file_find_close()

global.setting_color_scheme = max_scheme

global.levelstyler_colors_need_to_be_reloaded = true
room_restart()


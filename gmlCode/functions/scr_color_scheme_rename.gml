var in_path = argument0
var new_name = argument1

var in_path = string_trim_end(in_path, "/")
var in_path = string_trim_end(in_path, "\\")

var split_slashes = string_split_ext(in_path, ["/", "\\"])
show_debug_message(string(split_slashes))
var og_file_name = split_slashes[array_length(split_slashes) - 1]
var new_directory = string_delete(in_path, string_length(in_path) - string_length(og_file_name) + 1, string_length(og_file_name))

show_debug_message(og_file_name)
show_debug_message("Input path: " + in_path);
show_debug_message("New name: " + new_name);
show_debug_message("Directory: " + new_directory);

gml_Script_scr_copy_color_scheme(in_path, true, true, new_directory + new_name + "/")
directory_destroy(in_path)
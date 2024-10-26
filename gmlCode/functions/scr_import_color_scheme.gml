

var import_path = get_open_filename_ext("Normal.txt file|Normal.txt", "Normal.txt", program_directory, "Select a color scheme by opening the \"Normal.txt\" file inside it.")
var import_directory = string_trim_end(import_path, "Normal.txt")
gml_Script_scr_copy_color_scheme(import_directory, true, true)

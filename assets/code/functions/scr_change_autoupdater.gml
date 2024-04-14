var enabled = argument0

show_debug_message(global.shellworks_cache_directory)
if(!directory_exists(global.shellworks_cache_directory)){
    directory_create(global.shellworks_cache_directory)
}
global.dont_do_updates_cache_path = global.shellworks_cache_directory + "DoUpdates.txt"

var file = file_text_open_write(global.dont_do_updates_cache_path)
file_text_write_real(file, enabled)
file_text_close(file)

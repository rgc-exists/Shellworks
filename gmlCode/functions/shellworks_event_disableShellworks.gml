var file = file_text_open_write(global.shellworks_cache_directory + "needsToBeUpdated.txt")
file_text_write_real(file, 1)
file_text_close(file)
game_end()
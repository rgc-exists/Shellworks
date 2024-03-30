
file = file_text_open_read("SettoIngs23-2.set")
save_file_version = ""
while (!file_text_eof(file))
{
    section_header = file_text_read_string(file)
    file_text_readln(file)
    switch section_header
    {
        case "Game Version":
            save_file_version = file_text_read_string(file)
            file_text_readln(file)
            global.game_build_version = save_file_version
            break
    }

}
file_text_close(file)
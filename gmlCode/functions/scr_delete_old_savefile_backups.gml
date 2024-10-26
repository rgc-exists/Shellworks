
var deleted_count = 0

var filename = file_find_first("*.sav", fa_none)
while(filename != ""){
    if(string_pos("SaveFileBackup", filename) != 0){
        show_debug_message("Checking " + filename)
        var split_info = string_split(filename, "-")

        var ioff = 0
        if(string_starts_with(filename, "S2") || string_starts_with(filename, "S3"))
            ioff = 1

        var year = real(split_info[1 + ioff])
        var month = real(split_info[2 + ioff])
        var day = real(split_info[3 + ioff])
        var hour = real(split_info[4 + ioff])
        var minute = 1
        //For some reason Jonas skips minutes in his savefile backup original code.
        var second = real(split_info[5 + ioff])

        var file_date = date_create_datetime(year, month, day, hour, minute, second);



        var prev_year = current_year
        var prev_month = current_month - 1
        if(prev_month <= 0){
            prev_month = 12
            prev_year -= 1
        }
        var one_month_ago = date_create_datetime(prev_year, prev_month, current_day, current_hour, current_minute, current_second);

        show_debug_message("File date: " + string(year) + "/" + string(month) + "/" + string(day) + " " + string(hour) + ":" + string(minute) + ":" + string(second))
        show_debug_message("1-Month-Ago date: " + string(prev_year) + "/" + string(prev_month) + "/" + string(day) + " " + string(hour) + ":" + string(minute) + ":" + string(second))

        if(date_compare_datetime(file_date, one_month_ago) == -1){
            show_debug_message("Deleting " + filename)
            file_delete(filename)
            deleted_count += 1
        }

        // From scr_save_game_archive
        // strDate = ((((((((string(year) + "-") + string(month)) + "-") + string(day)) + "-") + string(hour)) + "-") + string(sec))
    }
    filename = file_find_next()
}

file_find_close()

gml_Script_shellworks_imgui_createpopup_message("Successfully deleted old savefiles backups.",
            "Successfully deleted " + string(deleted_count) + " savefile backups that were over a month old.", "Okay")
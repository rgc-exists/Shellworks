
if(instance_exists(obj_levelstyler)){

    var theme_type = argument0 

    var out_path = "Colors/" + string(global.setting_color_scheme) + "/" + theme_type + ".txt"
    var file = file_text_open_write(out_path)


    var levelstyler_local_colors = global.color_scheme_database.levelstyler_local_colors
    var names = variable_struct_get_names(levelstyler_local_colors)

    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(levelstyler_local_colors, name)

        with(obj_levelstyler){
            if(variable_instance_exists(id, value)){
                var color = variable_instance_get(id, value)
                file_text_write_string(file, name)
                file_text_writeln(file)
                file_text_write_string(file, "RGB: " + string(color_get_red(color)) + ", " + string(color_get_green(color)) + ", " + string(color_get_blue(color)))
                repeat(2) file_text_writeln(file)
            }
        }
    }



    var global_colors = global.color_scheme_database.global_colors
    var names = variable_struct_get_names(global_colors)

    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(global_colors, name)

        if(variable_global_exists(value)){
            var color = variable_global_get(value)
            file_text_write_string(file, name)
            file_text_writeln(file)
            file_text_write_string(file, "RGB: " + string(color_get_red(color)) + ", " + string(color_get_green(color)) + ", " + string(color_get_blue(color)))
            repeat(2) file_text_writeln(file)
        }
    }

    var global_threepartcolors = global.color_scheme_database.global_threepartcolors
    var names = variable_struct_get_names(global_threepartcolors)

    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var color_names = variable_struct_get(global_threepartcolors, name)
        var r = color_names[0]
        var g = color_names[1]
        var b = color_names[2]

        if(variable_global_exists(r) && variable_global_exists(g) && variable_global_exists(b)){
            file_text_write_string(file, name)
            file_text_writeln(file)
            file_text_write_string(file, string(variable_global_get(r)) + "\n" + string(variable_global_get(g)) + "\n" + string(variable_global_get(b)))
            repeat(2) file_text_writeln(file)
        }
    }


    var global_reals = global.color_scheme_database.global_reals
    var names = variable_struct_get_names(global_reals)

    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(global_reals, name)

        if(variable_global_exists(value)){
            if(!is_undefined(variable_global_get(value))){
                var real_val = variable_global_get(value)
                file_text_write_string(file, name)
                file_text_writeln(file)
                file_text_write_real(file, real_val)
                repeat(2) file_text_writeln(file)
            }
        }
    }

    file_text_close(file)

} else {
    show_debug_message("obj_levelstyler does not exists! You cannot save a color scheme at this time!")
}


var theme_type = argument0;

var folder_path = "Colors/" + string(global.setting_color_scheme) + "/"
var theme_file = theme_type + ".txt"

if(instance_exists(obj_levelstyler)){

    var file = file_text_open_write(folder_path + theme_file)
    var levelstyler_local_colors = global.color_scheme_database.levelstyler_local_colors

    var names = variable_struct_get_names(levelstyler_local_colors)
    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(levelstyler_local_colors, name)

        var color = variable_instance_get(instance_nearest(0, 0, obj_levelstyler), value)
        var r =  color_get_red(color)
        var g =  color_get_red(green)
        var b =  color_get_red(blue)
        
        file_text_write_string(file, name)
        file_text_writeln(file)
        file_text_write_string(file, "RGB: " + string(r) + ", " + string(g) + ", " + string(b))
        repeat(2) file_text_writeln(file)
    }

    var global_colors = global.color_scheme_database.global_colors

    var names = variable_struct_get_names(global_colors)
    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(global_colors, name)

        var color = variable_global_get(value)
        var r =  color_get_red(color)
        var g =  color_get_red(green)
        var b =  color_get_red(blue)
        
        file_text_write_string(file, name)
        file_text_writeln(file)
        file_text_write_string(file, "RGB: " + string(r) + ", " + string(g) + ", " + string(b))
        repeat(2) file_text_writeln(file)
    }

    var global_threepartcolors = global.color_scheme_database.global_threepartcolors

    var names = variable_struct_get_names(global_threepartcolors)
    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var values_rgb = variable_struct_get(global_threepartcolors, name)
        var value_r = values_rgb[0]
        var value_g = values_rgb[1]
        var value_b = values_rgb[2]

        var r =  variable_global_get(value_r)
        var g =  variable_global_get(value_g)
        var b =  variable_global_get(value_b)
        
        file_text_write_string(file, name)
        file_text_writeln(file)
        file_text_write_real(file, r)
        file_text_writeln(file)
        file_text_write_real(file, g)
        file_text_writeln(file)
        file_text_write_real(file, b)
        repeat(2) file_text_writeln(file)
    }

    var global_reals = global.color_scheme_database.global_reals

    var names = variable_struct_get_names(global_reals)
    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(global_reals, name)

        var real_value = variable_global_get(value)
        
        file_text_write_string(file, name)
        file_text_writeln(file)
        file_text_write_real(file, value)
        repeat(2) file_text_writeln(file)
    }

    var levelstyler_local_reals = global.color_scheme_database.levelstyler_local_reals

    var names = variable_struct_get_names(levelstyler_local_reals)
    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(levelstyler_local_reals, name)

        var real_value = variable_instance_get(instance_nearest(0, 0, obj_levelstyler), value)
        
        file_text_write_string(file, name)
        file_text_writeln(file)
        file_text_write_real(file, value)
        repeat(2) file_text_writeln(file)
    }

} else {
    show_debug_message("obj_levelstyler does not exist! You cannot save colors right now!")
}

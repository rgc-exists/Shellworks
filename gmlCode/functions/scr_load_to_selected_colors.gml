
if(instance_exists(obj_levelstyler)){


    var levelstyler_local_colors = global.color_scheme_database.levelstyler_local_colors
    var names = variable_struct_get_names(levelstyler_local_colors)

    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(levelstyler_local_colors, name)

        with(obj_levelstyler){
            var global_var_name = value + "_selected"
            variable_global_set(global_var_name, scr_get_color_hueshifted(variable_instance_get(id, value), -hueshift_all))
        }
    }



    var global_colors = global.color_scheme_database.global_colors
    var names = variable_struct_get_names(global_colors)

    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(global_colors, name)

        var global_var_name = value + "_selected"
        if(global_var_name == "col_lvlselect_moretoexplore_arrow_selected") global_var_name = "col_lvlselect_moretoexplore_arrow_selected_2"

        variable_global_set(global_var_name, scr_get_color_hueshifted(variable_global_get(value), -hueshift_all))
    }

    var global_threepartcolors = global.color_scheme_database.global_threepartcolors
    var names = variable_struct_get_names(global_threepartcolors)

    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var color_names = variable_struct_get(global_threepartcolors, name)
        var r = color_names[0]
        var g = color_names[1]
        var b = color_names[2]

        var global_var_name_r = r + "_selected"
        var global_var_name_g = g + "_selected"
        var global_var_name_b = b + "_selected"
        variable_global_set(global_var_name_r, variable_global_get(r))
        variable_global_set(global_var_name_g, variable_global_get(g))
        variable_global_set(global_var_name_b, variable_global_get(b))
    }

    var global_threeparts_butnormal_colors = global.color_scheme_database.global_threeparts_butnormal_colors
    var names = variable_struct_get_names(global_threeparts_butnormal_colors)

    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var color_names = variable_struct_get(global_threeparts_butnormal_colors, name)
        var r = color_names[0]
        var g = color_names[1]
        var b = color_names[2]

        var global_var_name_r = r + "_selected"
        var global_var_name_g = g + "_selected"
        var global_var_name_b = b + "_selected"
        var col = make_color_rgb(variable_global_get(r), variable_global_get(g), variable_global_get(b))
        col = scr_get_color_hueshifted(col, -hueshift_all)
        variable_global_set(global_var_name_r, color_get_red(col))
        variable_global_set(global_var_name_g, color_get_green(col))
        variable_global_set(global_var_name_b, color_get_blue(col))
    }


    var global_reals = global.color_scheme_database.global_reals
    var names = variable_struct_get_names(global_reals)

    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(global_reals, name)

        var global_var_name = value + "_selected"
        variable_global_set(global_var_name, variable_global_get(value))
    }


    var levelstyler_local_reals = global.color_scheme_database.levelstyler_local_reals
    var names = variable_struct_get_names(levelstyler_local_reals)

    for(var i = 0; i < array_length(names); i++){
        var name = names[i]
        var value = variable_struct_get(levelstyler_local_reals, name)

        with(obj_levelstyler){
            var global_var_name = value + "_selected"
            variable_global_set(global_var_name, variable_instance_get(id, value))
        }
    }

} else {
    show_debug_message("obj_levelstyler does not exists! You cannot apply colors at this time!")
}
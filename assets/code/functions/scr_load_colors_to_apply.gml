
if(instance_exists(obj_levelstyler)){

    var levelstyler_local_colors = global.color_scheme_database.levelstyler_local_colors

    var names = variable_struct_get_names(levelstyler_local_colors)
    for(var i = 0; i < array_length(names); i++){
        var value = variable_struct_get(levelstyler_local_colors, names[i])

        if(variable_global_exists(value)){
            variable_instance_set(instance_nearest(0, 0, obj_levelstyler), value + "_selected", variable_global_get(value))
        }
    }

    var global_colors = global.color_scheme_database.global_colors

    var names = variable_struct_get_names(global_colors)
    for(var i = 0; i < array_length(names); i++){
        var value = variable_struct_get(global_colors, names[i])

        if(variable_global_exists(value)){
            var global_var_name = value + "_selected"
            if(global_var_name == "col_lvlselect_moretoexplore_arrow_selected") global_var_name = "col_lvlselect_moretoexplore_arrow_selected_2"
            
            variable_global_set(global_var_name, variable_global_get(value))
        }
    }

    var global_threepartcolors = global.color_scheme_database.global_threepartcolors

    var names = variable_struct_get_names(global_threepartcolors)
    for(var i = 0; i < array_length(names); i++){
        var values_rgb = variable_struct_get(global_threepartcolors, names[i])
        var value_r = values_rgb[0]
        var value_g = values_rgb[1]
        var value_b = values_rgb[2]

        if(variable_global_exists(value_r) && variable_global_exists(value_g) && variable_global_exists(value_b)){
            variable_global_set(value_r + "_selected", variable_global_get(value_r))
            variable_global_set(value_g + "_selected", variable_global_get(value_g))
            variable_global_set(value_b + "_selected", variable_global_get(value_b))
        }
    }

    var global_reals = global.color_scheme_database.global_reals

    var names = variable_struct_get_names(global_reals)
    for(var i = 0; i < array_length(names); i++){
        var value = variable_struct_get(global_reals, names[i])

        if(variable_global_exists(value)){
            variable_global_set(value + "_selected", variable_global_get(value))
        }
    }

    var levelstyler_local_reals = global.color_scheme_database.levelstyler_local_reals

    var names = variable_struct_get_names(levelstyler_local_reals)
    for(var i = 0; i < array_length(names); i++){
        var value = variable_struct_get(levelstyler_local_reals, names[i])

        if(variable_global_exists(value)){
            variable_instance_set(instance_nearest(0, 0, obj_levelstyler), value + "_selected", variable_global_get(value))
        }
    }

} else {
    show_debug_message("obj_levelstyler does not exist! You cannot set colors to apply right now!")
}
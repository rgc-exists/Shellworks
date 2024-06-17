var restart_room = argument0
if(is_undefined(restart_room)) restart_room = true

if(instance_exists(obj_levelstyler)){

    var levelstyler_local_colors = global.color_scheme_database.levelstyler_local_colors

    var names = variable_struct_get_names(levelstyler_local_colors)
    for(var i = 0; i < array_length(names); i++){
        var value = variable_struct_get(levelstyler_local_colors, names[i])

        if(variable_global_exists(value + "_selected")){
            variable_instance_set(instance_nearest(0, 0, obj_levelstyler), value, variable_global_get(value + "_selected"))
        }
    }

    var global_colors = global.color_scheme_database.global_colors

    var names = variable_struct_get_names(global_colors)
    for(var i = 0; i < array_length(names); i++){
        var value = variable_struct_get(global_colors, names[i])

        if(variable_global_exists(value + "_selected")){
            variable_global_set(value, variable_global_get(value + "_selected"))
        }
    }

    var global_threepartcolors = global.color_scheme_database.global_threepartcolors

    var names = variable_struct_get_names(global_threepartcolors)
    for(var i = 0; i < array_length(names); i++){
        var values_rgb = variable_struct_get(global_threepartcolors, names[i])
        var value_r = values_rgb[0]
        var value_g = values_rgb[1]
        var value_b = values_rgb[2]

        if(variable_global_exists(value_r + "_selected") && variable_global_exists(value_g + "_selected") && variable_global_exists(value_b + "_selected")){
            variable_global_set(value_r, variable_global_get(value_r + "_selected"))
            variable_global_set(value_g, variable_global_get(value_g + "_selected"))
            variable_global_set(value_b, variable_global_get(value_b + "_selected"))
        }
    }

    var global_reals = global.color_scheme_database.global_reals

    var names = variable_struct_get_names(global_reals)
    for(var i = 0; i < array_length(names); i++){
        var value = variable_struct_get(global_reals, names[i])

        if(variable_global_exists(value + "_selected")){
            variable_global_set(value, variable_global_get(value + "_selected"))
        }
    }

    var levelstyler_local_reals = global.color_scheme_database.levelstyler_local_reals

    var names = variable_struct_get_names(levelstyler_local_reals)
    for(var i = 0; i < array_length(names); i++){
        var value = variable_struct_get(levelstyler_local_reals, names[i])

        if(variable_global_exists(value + "_selected")){
            variable_instance_set(instance_nearest(0, 0, obj_levelstyler), value, variable_global_get(value + "_selected"))
        }
    }

    global.levelstyler_colors_need_to_be_reloaded = true
    global.just_applied_colors = true
    
    if(restart_room) room_restart()
} else {
    show_debug_message("obj_levelstyler does not exist! You cannot apply colors right now!")
}
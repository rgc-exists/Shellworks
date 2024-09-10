if(variable_struct_get(argument0, "preview_sprite_index") != undefined && variable_struct_get(argument0, "preview_sprite_index") != 0){
    return #orig#(argument0)
} else if(variable_struct_get(argument0, "preview_sprite_index_once_placed") != undefined && variable_struct_get(argument0, "preview_sprite_index_once_placed") != 0){
    return argument0.preview_sprite_index_once_placed
} else {
    return spr_lvlico_fish
}
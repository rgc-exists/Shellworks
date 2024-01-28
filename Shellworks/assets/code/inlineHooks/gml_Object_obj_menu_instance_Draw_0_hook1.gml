if(string_pos("colormenu_", object_get_name(object_index)) != 0){
    yspacing = 50
}
if(string_pos("obj_menu_wysapi_player_character", object_get_name(object_index)) != 0){
    yspacing = 75
}
if(object_get_name(object_index) == "obj_menu_wysapi_level_editor" || object_get_name(object_index) == "obj_menu_Controls"){
    yspacing = 75
}
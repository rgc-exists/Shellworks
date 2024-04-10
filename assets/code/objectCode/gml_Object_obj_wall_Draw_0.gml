if(room == level_editor_play_mode){
    if(variable_global_exists("walls_visible")){
        if(global.walls_visible){
            draw_self()
        } else {
            image_alpha = 0
            visible = false
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0)
        }
    } else {
        draw_self()
    }
} else {
    draw_self()
}


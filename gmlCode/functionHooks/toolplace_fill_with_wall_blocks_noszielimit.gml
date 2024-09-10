if(keyboard_check(vk_lalt)){
    if(keyboard_check(ord("B"))){
        return toolplace_fill_with_stripes(argument0, argument1)
    } else {
        return #orig#(argument0, argument1)
    }
} else {
    if(keyboard_check(ord("X"))){
        return toolplace_delete_blocks_all_in_rect(argument0, argument1)
    } else if(keyboard_check(vk_ralt) && !(keyboard_check_pressed(vk_lalt))){
        return toolplace_fill_with_blocks(argument0, argument1)
    } else if(keyboard_check(ord("B"))){
        return toolplace_fill_with_stripes(argument0, argument1)
    } else if(keyboard_check(ord("C"))){
        return toolplace_fill_with_wall_blocks(argument0, argument1)
    } else {
        return #orig#(argument0, argument1)
    }
}
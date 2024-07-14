var selected = argument0
if(instance_exists(argument0)){
    if(!keyboard_check(vk_lalt)){
        if(selected.is_wall_like && selected.is_wall){
            if(selected.sprite_width % 60 == 0 && selected.sprite_height % 60 == 0){
                return #orig#(argument0, argument1, argument2, argument3, argument4)
            } else {
                instance_destroy(selected)
            }
        }
    }
}

if(global.just_loaded_savestate){
    global.just_loaded_savestate = false
    with obj_underwater_current {
        visible = true
    }
}


if(global.savestates_enabled){
    if(keyboard_check_pressed(vk_f6)){
        gml_Script_scr_new_checkpoint()
    } else 
    if(keyboard_check_pressed(vk_f7)){
        gml_Script_scr_load_checkpoint()
    }
}

#orig#()
if(go_to_a_room_next){
    go_to_a_room_next = false
    room_goto(room_to_goto_next)
}
if(room != level_editor && room != level_editor_play_mode && room != menu && room != main_menu_dark){
    if(variable_instance_exists(id, "swapPump_remember")){
        if(swapPump_remember != global.save_pump_is_inverted){
            room_restart()
        }
    }
    if(variable_instance_exists(id, "heartFixed_remember")){
        if(heartFixed_remember != global.save_heart_fixed && room != InBrain_02 && room != InBrain_Controlroom){
            room_restart()
        }
    }
    if(should_restart_after_exit_menu){
        should_restart_after_exit_menu = 0
        room_restart()
    }
    swapPump_remember = global.save_pump_is_inverted
    heartFixed_remember = global.save_heart_fixed
}
if(keyboard_check(ord("Y")) && keyboard_check(ord("O"))){
    aivl_play_ext("squid_yo", -1, -1, 3, 0, 1)
}

if(room != level_editor && room != menu){
    global.inspector_active = false
}




if(instance_exists(obj_player)){
    global.player_has_existed = true

    if(obj_player.dead >= 0){
        global.player_is_dead = true
    } else {
        global.player_is_dead = false
    }
} else {
    global.player_is_dead = false
}

if(global.room_remember != room && room != menu){
    global.room_remember = room
    global.player_exists_remember = false
}

/*
if(global.setting_gamespeed_audio){
    if(global.save_game_speed != 1){
        var hishelf_effect = audio_create_effect(AudioEffectType.HiShelf)
        hishelf_effect.
        //NOTE TO SELF: HISHELF DIDNT DO WHAT I THINK IT DID. CONTINUE WORK TRYING TO FIGURE OUT A SYSTEM OF CHANGING PITCH TOMORROW.
    }
}
*/
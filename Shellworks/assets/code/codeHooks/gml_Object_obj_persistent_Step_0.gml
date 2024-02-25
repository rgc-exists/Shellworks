
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

if(global.inspector_active && room == level_editor){
    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1920 * .7 + 2, 2, 1920 - 2, 1080 - 2)){
        prevMouseInInspector = true
        global.editor_input_disabled = true
        script_execute(variable_struct_get(global.inputaction_jump, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_move_right, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_pause_menu, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_move_left, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_navigate_confirm, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_navigate_up, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_navigate_down, "MakeInvalidTillReleased"))
        global.input_confirm_pressed = 0
        global.input_jump_pressed = 0
        global.input_jump = 0
        global.input_x = 0
        global.input_x_pressed = 0
        global.input_confirm_pressed = 0
        global.input_down = 0
        global.input_down_pressed = 0
    } else {
        prevMouseInInspector = false 
        global.editor_input_disabled = false
    }
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

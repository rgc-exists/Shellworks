
#orig#()
if(global.global_inspector_active){
    if(!point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 2, 2, 1920 - 2, 1080 - 2)){
        global.input_confirm_pressed = 0
        global.input_x = 0
        global.input_x_pressed = 0
        global.input_jump = 0
        global.input_jump_pressed = 0
        global.input_down = 0
        global.input_down_pressed = 0
        global.input_skipvoice_pressed = 0
        global.input_reset = 0
        global.input_analysis_using_gamepad = global.inputsystem_is_player_using_gamepad
    }
}

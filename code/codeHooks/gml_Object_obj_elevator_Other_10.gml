global.input_reset = 0
if place_meeting((x - 55), (y - 5), obj_player)
{
    if global.input_jump
        input_y = -1
    else if global.input_down
        input_y = 1
    else
        input_y = 0
    if input_y != 0 || input_y != input_y_last_can_be_0
        hold_timer += 1
    else
        hold_timer = 0
    if global.input_jump_pressed ||
    (((hold_timer > 40 && hold_timer % 10 == 0) || (hold_timer > 240 && hold_timer % 5 == 0)) && input_y < 0)
        input_pressed = -1
    else if global.input_down_pressed ||
    (((hold_timer > 40 && hold_timer % 10 == 0) || (hold_timer > 240 && hold_timer % 5 == 0)) && input_y > 0)
        input_pressed = 1
    else
        input_pressed = 0
    global.input_jump = 0
    global.input_jump_pressed = 0
}
input_y_last_can_be_0 = input_y

#orig#()

if(!went_to_next_room){
    global.total_half_jumps_so_far_can_change = false
}
if (global.save_speedrun_timer_game > 0)
{
    global.save_speedrun_timer_attempt -= (delta_time / 1000000)
    global.save_speedrun_timer_attempt += (1 / room_speed)
    global.save_speedrun_timer_attempt = max(0, global.save_speedrun_timer_attempt)
}
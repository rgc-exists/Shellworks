#orig#()

if (global.save_speedrun_timer_game > 0)
{
    global.save_speedrun_timer_attempt -= (delta_time / 1000000)
    global.save_speedrun_timer_attempt += (1 / room_speed)
    global.save_speedrun_timer_attempt = max(0, global.save_speedrun_timer_attempt)
}
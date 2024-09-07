if((instance_exists(obj_player) && obj_player.dead >= 0) || instance_exists(obj_level_transition)){
    return false;
}


global.save_speedrun_timer_attempt += (delta_time / 1000000)
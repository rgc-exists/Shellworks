if(global.invincible_mode || global.td_invincible_mode || global.fuse_invincible_mode || global.ball_invincible_mode || global.infinite_jumps || global.cheat_jump_height != 1 || global.cheat_player_speed != 1 || global.save_game_speed != 1){
    global.save_speedrun_is_still_legit = false
    global.is_legit_right_now = false
} else {
    global.is_legit_right_now = true
}
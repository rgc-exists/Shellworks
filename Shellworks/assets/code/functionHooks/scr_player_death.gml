if(global.invincible_mode && !((global.last_death_by == -7) && !global.restart_invincible_mode) && !((just_hit_fuse) && !global.fuse_invincible_mode)){
    return false;
} else if(((global.last_death_by == -7) && global.restart_invincible_mode) || ((just_hit_fuse) && global.fuse_invincible_mode)){
    return false;
} else {
    return #orig#(argument0, argument1)
}
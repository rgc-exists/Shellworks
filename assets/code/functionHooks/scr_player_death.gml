if(global.setting_noclip_indicator){
    obj_persistent.noclip_deathFX_fadeout = global.setting_noclip_indicator_transparency
}

if(global.invincible_mode && !((global.last_death_by == -7) && !global.restart_invincible_mode) && !((just_hit_fuse) && !global.fuse_invincible_mode)){
    return false;
} else if(((global.last_death_by == -7) && global.restart_invincible_mode) || ((just_hit_fuse) && global.fuse_invincible_mode)){
    return false;
} else {
    var return_value = #orig#(argument0, argument1)
    if(global.enable_april_fools_ads){
        if(irandom(12) == 0){
            if(array_length(global.aprilfools_video_paths) > 0){
                with(obj_persistent){
                    gml_Script_scr_open_april_fools_ad()
                }
            }
        }
    }
    return return_value
}
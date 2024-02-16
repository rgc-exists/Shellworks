if(room != community_campaign_lvlselect){
    if(global.save_exploration_mode >= 2){
        locked_level = false
        more_to_explore = false
        sprite_index = scr_level_dat_get_icon(level)
        if ((sprite_index == spr_lvlico_finalboss || sprite_index == spr_lvlico_finalbossS2) && global.save_heart_fixed)
            sprite_index = spr_lvlico_squidgone
    }
}
#orig#()
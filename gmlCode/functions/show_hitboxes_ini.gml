
global.li_solid_objects = []
for(var i = 0; i < 10000; i++){
    if(object_exists(i)){
        if(object_get_solid(i)){
            array_push(global.li_solid_objects, i)
        }
    } else {
        break;
    }
}
array_push(global.li_solid_objects, obj_difficulty_shower)
global.li_deadly_objects = [obj_spike, obj_cat, obj_lasertrap, obj_laserstorm, obj_rusty_spike, obj_fuse_voice, obj_badball, obj_enemy, obj_fish, obj_jellyfish, obj_ice_spike, obj_deadly_bubble, obj_missile, obj_dance_drone, obj_spike_permanent, obj_squasher, obj_sh_enemy_splitty, obj_protector, obj_bomb, obj_destructable_block_drop, obj_sh_enemy_normy, obj_disco_laser, obj_enemy_drone, obj_ai_laser, obj_enemy_piranha, obj_waterboss, obj_tentacle, obj_jerry, obj_snowman_shot, obj_mafia_snowman, obj_torpedo, obj_baby_shark, obj_evil_snail, obj_boss, obj_boss_missle, obj_boss_p2, obj_badball_boss_p2, obj_glitchy_projectile, obj_glitchy_thing, obj_enemy_snail, obj_destroyed_wall, obj_danceboss_head_old, obj_danceboss_leg, obj_shark_submarine, obj_danceboss_head, obj_fuse_aftersecret, obj_firewall, obj_sd_enemy, obj_lava, obj_rusty_lava]
global.li_collectible_objects = [obj_sh_gun, obj_sh_gun2, obj_sh_gun3, obj_sh_gun4, obj_hat_collectible_parent, obj_hat_collectible_heart, obj_exploration_point, obj_chip_editor, obj_dialog_file, obj_smiley_collectable_coin, obj_smiley_coin_scatter, obj_r_finish_line, obj_ball, obj_target, obj_uplifter, obj_speedbooster, obj_cashcow_powerup, obj_cashcow_powerup_editor, obj_basket, obj_bubble, obj_exploration_point_ranged, obj_exploration_point_editor, obj_basket, obj_sh_guneditor, obj_basket_leveleditor]
global.li_collectible_object_names = ["UPWARD GUN", "FORWARD GUN", "DOWNWARD GUN", "AUTO-AIM GUN", "HAT", "COLLECTIBLE HEART", "EXPLORATION POINT", "VICTORY ITEM", "DIALOG FILE", "SMILEY", "SMILEY", "FINISH LINE", "BASKETBALL", "TARGET", "UPLIFTER", "SPEED BOOSTER", "CASHCOW", "CASHCOW", "BASKET", "BUBBLE", "EXPLORATION POINT", "EXPLORATION POINT", "BASKET", "GUN", "BASKET"];
global.li_trigger_objects = [obj_lt_music_trigger, obj_lt_AI_trigger, obj_lvledtior_trigger_powerable, obj_stop_playing_music_trigger, obj_lt_action_trigger, obj_lt_zoom_trigger, obj_end_game_trigger, obj_snowman_trigger, obj_aivl_trigger_parent, obj_spike_trigger_trailer]
global.li_trigger_object_names = ["MUSIC TRIGGER", "AI TRIGGER", "PLAYER TRIGGER", "STOP MUSIC TRIGGER", "ACTION TRIGGER", "LVLEDITOR ZOOM TRIGGER", "END GAME TRIGGER", "SNOWMAN TRIGGER", "VOICELINE TRIGGER", "TRAILER SPIKE TRIGGER"]
global.li_wireable_objs = [obj_antenna, obj_antenna_big_range, obj_antenna_floaty, obj_power_generator_far, obj_power_generator, ]

//show_message(string(global.li_solid_objects))

global.li_hitbox_objects = ds_list_create()

for(var i = 0; i < array_length(global.li_solid_objects); i++){
    var obj = global.li_solid_objects[i]
    if(ds_list_find_index(global.li_hitbox_objects, obj) == -1){
        ds_list_add(global.li_hitbox_objects, obj)
    }
}
for(var i = 0; i < array_length(global.li_deadly_objects); i++){
    var obj = global.li_deadly_objects[i]
    if(ds_list_find_index(global.li_hitbox_objects, obj) == -1){
        ds_list_add(global.li_hitbox_objects, obj)
    }
}
for(var i = 0; i < array_length(global.li_collectible_objects); i++){
    var obj = global.li_collectible_objects[i]
    if(ds_list_find_index(global.li_hitbox_objects, obj) == -1){
        ds_list_add(global.li_hitbox_objects, obj)
    }
}
for(var i = 0; i < array_length(global.li_trigger_objects); i++){
    var obj = global.li_trigger_objects[i]
    if(ds_list_find_index(global.li_hitbox_objects, obj) == -1){
        ds_list_add(global.li_hitbox_objects, obj)
    }
}
for(var i = 0; i < array_length(global.li_wireable_objs); i++){
    var obj = global.li_wireable_objs[i]
    if(ds_list_find_index(global.li_hitbox_objects, obj) == -1){
        ds_list_add(global.li_hitbox_objects, obj)
    }
}

ds_list_add(global.li_hitbox_objects, obj_player)

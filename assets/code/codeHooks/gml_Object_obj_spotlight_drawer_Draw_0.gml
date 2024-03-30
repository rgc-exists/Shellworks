if (global.setting_visual_details == 0)
    return false;
if (global.spotlight_alpha <= 0.01)
    return false;
gpu_set_blendmode(bm_add)
with (obj_player)
{
    if(global.setting_player_spotlight == -1){
        colA = obj_levelstyler.col_player_spotlight
    } else {
        colA = merge_color(global.setting_player_spotlight, c_black, 0.6)
    }
    if(global.setting_player_spotlight_dark == -1){
        colB = obj_levelstyler.col_player_spotlight_dark
    } else {
        colB = merge_color(global.setting_player_spotlight_dark, c_black, 0.8)
    }
    col_spotlight = merge_color(colA, colB, global.level_flicker)
    col_spotlight = merge_color(c_black, col_spotlight, global.spotlight_alpha)
    if (col_spotlight != c_black)
        draw_sprite_ext(spr_flare, 0, x, y, 0.8, 0.8, 0, col_spotlight, global.spotlight_alpha)
}
gpu_set_blendmode(bm_normal)

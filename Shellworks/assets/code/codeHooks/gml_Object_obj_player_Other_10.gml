if(global.setting_player_body == -1){
    col_snail_body = obj_levelstyler.col_snail_body
} else {
    col_snail_body = global.setting_player_body
}
if(global.setting_player_outline == -1){
    col_snail_outline = obj_levelstyler.col_snail_outline
} else {
    col_snail_outline = global.setting_player_outline
}
if(global.setting_player_shell == -1){
    col_snail_shell = obj_levelstyler.col_snail_shell
} else {
    col_snail_shell = global.setting_player_shell
}
if(global.setting_player_eye == -1){
    col_snail_eye = obj_levelstyler.col_snail_eye
} else {
    col_snail_eye = obj_levelstyler.col_snail_shell
}
eye1.col_snail_outline = col_snail_outline
eye1.col_snail_body = col_snail_body
eye1.col_snail_shell = col_snail_shell
eye1.col_snail_eye = col_snail_eye
eye2.col_snail_outline = col_snail_outline
eye2.col_snail_body = col_snail_body
eye2.col_snail_shell = col_snail_shell
eye2.col_snail_eye = col_snail_eye
if(instance_exists(obj_levelstyler)){
    if(global.setting_player_death != -1){
        obj_levelstyler.col_snail_death = global.setting_player_death
    }
}
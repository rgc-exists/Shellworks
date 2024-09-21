global.current_spawnpoints_list = []

with(obj_player){
    array_push(global.current_spawnpoints_list, [xstart, ystart])
}

with(obj_player_spawnpoint){
    array_push(global.current_spawnpoints_list, [xstart, ystart])
}
global.current_spawnpoint = 0
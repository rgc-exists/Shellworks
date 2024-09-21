var spawnPoint = argument0

var spawn_pos = global.current_spawnpoints_list[spawnPoint]
scr_room_reset()
obj_player.x = spawn_pos[0]
obj_player.y = spawn_pos[1]
obj_player.xstart = spawn_pos[0]
obj_player.ystart = spawn_pos[1]
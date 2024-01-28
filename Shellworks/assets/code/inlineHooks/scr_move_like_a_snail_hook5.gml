if(global.setting_player_trail == -1){
    col_player_trail_idk = obj_levelstyler.col_player_trail
} else {
    col_player_trail_idk = global.setting_player_trail
}
idmerk = instance_create_layer(x, (y + 20), "Fx", obj_fx_flare)
idmerk.decay = 0.8
idmerk.image_blend = col_player_trail_idk
idmerk.image_xscale = 0.25
idmerk.image_yscale = 0.25
idmerk.vspeed = 8
idmerk = instance_create_layer(x, (y + 20), "Fx", obj_fx_flare)
idmerk.decay = 0.9
idmerk.image_blend = col_player_trail_idk
idmerk.image_xscale = 0.25
idmerk.image_yscale = 0.25
idmerk.vspeed = 3
idmerk = instance_create_layer(x, (y + 20), "Fx", obj_fx_flare)
idmerk.decay = 0.95
idmerk.image_blend = col_player_trail_idk
idmerk.image_xscale = 0.25
idmerk.image_yscale = 0.25
idmerk.vspeed = 0
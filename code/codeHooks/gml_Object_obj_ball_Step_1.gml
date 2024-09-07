if(global.save_equipped_hat == 2 && !global.setting_unicorn_horn_ball_override){
    global.save_equipped_hat = -1
    #orig#()
    global.save_equipped_hat = 2
} else {
    #orig#()
}
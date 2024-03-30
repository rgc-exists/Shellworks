/*if(global.update_available){
    #orig#()
    timer++
} else {
    */
    if(global.setting_epilepsy_warning){
        #orig#()
    } else {
        room_goto(2)
    }
//}
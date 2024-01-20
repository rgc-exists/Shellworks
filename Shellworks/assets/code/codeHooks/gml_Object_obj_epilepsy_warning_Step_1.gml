if(global.update_available){
    #orig#()
    timer++
} else {
    if(global.setting_epilepsy_warning || !file_exists("SettoIngs23-2.set")){
        #orig#()
    } else {
        room_goto(2)
    }
}
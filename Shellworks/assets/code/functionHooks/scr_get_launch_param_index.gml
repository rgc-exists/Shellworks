if(argument0 == "editor_squid" && global.setting_squid_in_editor){
    return true
} else {
    return #orig#(argument0)
}
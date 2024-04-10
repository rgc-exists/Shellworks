var return_value = #orig#()

if(variable_instance_exists(id, "wallVisible")){
    if(wallVisible)
        global.walls_visible = true
    else
        global.walls_visible = false
}


return return_value
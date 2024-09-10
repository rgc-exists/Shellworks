if(variable_instance_exists(id, "onlyVanilla")){
    if(onlyVanilla){
        return file_exists("SettoIngs23-2.set")
    } else {
        return (file_exists("SettoIngs23-2.set") || file_exists("Shellworks_SettoIngs23-2.set"))
    }
}
else
    return (file_exists("SettoIngs23-2.set") || file_exists("Shellworks_SettoIngs23-2.set"))
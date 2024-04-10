var instance = argument0 
var object_index_find = argument1 
if(object_index_find == undefined){
    object_index_find = instance.object_index
}
//show_message(object_index_find)
for(var i = 0; i < instance_number(object_index_find); i++){
    var instance_B = instance_find(object_index_find, i)
    if(instance_B == instance){
        //show_message("FOUND INST: " + string(i))
        return i
    }
}

return -1
var cur_array = argument0
var new_struct = modhelper_create_struct()
for(var i = 0; i < array_length(cur_array)i += 2) {
    variable_struct_set(new_struct, cur_array[i], cur_array[i+1])
}
return new_struct
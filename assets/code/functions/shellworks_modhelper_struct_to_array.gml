//Original code by x8c8r, modified a fair amount
var cur_struct = argument0
var res = [];
var names = variable_struct_get_names(cur_struct);
for (var i = 0; i < array_length(names); i++) {
    array_push(res, names[i])
    array_push(res, variable_struct_get(cur_struct, names[i]))
}
return res;
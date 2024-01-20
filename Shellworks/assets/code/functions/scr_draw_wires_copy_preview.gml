current_wires_to_load = argument0
current_objects_to_load = argument1
x_off = argument2
y_off = argument3
for(var i = 0; i < ds_list_size(current_wires_to_load); i++){
    wire = ds_list_find_value(current_wires_to_load, i)
    obj1 = current_objects_to_load[wire[0]]
    obj2 = current_objects_to_load[wire[1]]
    rot_data_1 = hlp_rotate_object_data(argument2, argument3, (argument2 + variable_struct_get(obj1, "x")), (argument3 + variable_struct_get(obj1, "y")), variable_struct_get(argument4, "image_angle"), variable_struct_get(obj1, "toolStruct"), obj1, variable_struct_get(obj1, "x"), variable_struct_get(obj1, "y"))
    rot_data_2 = hlp_rotate_object_data(argument2, argument3, (argument2 + variable_struct_get(obj2, "x")), (argument3 + variable_struct_get(obj2, "y")), variable_struct_get(argument4, "image_angle"), variable_struct_get(obj2, "toolStruct"), obj2, variable_struct_get(obj2, "x"), variable_struct_get(obj2, "y"))
    
    gml_Script_scr_draw_puzzle_laser(variable_struct_get(rot_data_1, "x"), variable_struct_get(rot_data_1, "y"), variable_struct_get(rot_data_2, "x"), variable_struct_get(rot_data_2, "y"), 12, obj_levelstyler.col_snail, 1)
}
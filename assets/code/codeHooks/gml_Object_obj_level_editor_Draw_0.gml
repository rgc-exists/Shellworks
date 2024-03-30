var level_bound_x1_remember = level_bound_x1
var level_bound_y1_remember = level_bound_y1
var level_bound_x2_remember = level_bound_x2
var level_bound_y2_remember = level_bound_y2

#orig#()

if(global.inspector_active){
    if(variable_global_exists("inspector_selected_obj")){
        if(!is_undefined(global.inspector_selected_obj)){
            if(instance_exists(global.inspector_selected_obj)){
                hlp_draw_bounding_box_around_obj(global.inspector_selected_obj, 4, c_white)
            }
        }
    }
}
if(variable_instance_exists(id, "inspector_select_cooldown")){
    inspector_select_cooldown--;
}

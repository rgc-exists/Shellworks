if(global.show_hitboxes || (global.setting_show_hitboxes_on_death && global.player_is_dead)){
    gml_Script_scr_show_hitboxes()
}
if(global.global_inspector_active){
    if(variable_global_exists("global_inspector_selected_obj")){
        if(instance_exists(global.global_inspector_selected_obj)){
            draw_set_alpha(0.8)
            outlineOffset = 0
            draw_set_color(c_white)
            var x1 = global.global_inspector_selected_obj.bbox_left - outlineOffset
            var y1 = global.global_inspector_selected_obj.bbox_top + outlineOffset
            var x2 = global.global_inspector_selected_obj.bbox_right + outlineOffset
            var y2 = global.global_inspector_selected_obj.bbox_bottom + outlineOffset
            draw_rectangle(x1, y1, x2, y2, true)
            
            outlineOffset = 1
            draw_set_color(c_white)
            var x1 = global.global_inspector_selected_obj.bbox_left - outlineOffset
            var y1 = global.global_inspector_selected_obj.bbox_top + outlineOffset
            var x2 = global.global_inspector_selected_obj.bbox_right + outlineOffset
            var y2 = global.global_inspector_selected_obj.bbox_bottom + outlineOffset
            draw_rectangle(x1, y1, x2, y2, true)
            
            outlineOffset = 2
            draw_set_color(c_black)
            var x1 = global.global_inspector_selected_obj.bbox_left - outlineOffset
            var y1 = global.global_inspector_selected_obj.bbox_top + outlineOffset
            var x2 = global.global_inspector_selected_obj.bbox_right + outlineOffset
            var y2 = global.global_inspector_selected_obj.bbox_bottom + outlineOffset
            draw_rectangle(x1, y1, x2, y2, true)

            outlineOffset = -1
            draw_set_color(c_black)
            var x1 = global.global_inspector_selected_obj.bbox_left - outlineOffset
            var y1 = global.global_inspector_selected_obj.bbox_top + outlineOffset
            var x2 = global.global_inspector_selected_obj.bbox_right + outlineOffset
            var y2 = global.global_inspector_selected_obj.bbox_bottom + outlineOffset
            draw_rectangle(x1, y1, x2, y2, true)

            draw_set_alpha(1)
        }
    }
}
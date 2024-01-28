//Dear modders of my mod, Please forgive me for the horrible sins I have commited:
//Copying and pasting the same goddamn code like 50 times with slight changes instead of making a function
//I apologize for the pain you are about to go through modding this script :skull:




if(global.inspector_active && room == level_editor){
    gml_Script_scr_draw_inspector_tool_UI()
} else if(global.global_inspector_active && room != level_editor && room != menu && room != main_menu_dark && room != disclaimer_photoepilepsy) {
    gml_Script_scr_draw_global_inspector_UI()
} else {
    display_set_gui_size(1920, 1080)
    
    if(global.rendering_enabled || room = menu){
        #orig#()
    } else {
        draw_set_color(c_black)
        draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), false)
        draw_set_font(global.font_aiTalk)
        draw_set_halign(fa_middle)
        draw_set_valign(fa_center)
        draw_set_color(c_dkgray)
        draw_text(camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) / 2, "RENDERING DISABLED")
    }
}

#orig#()

if(global.shellworks_imgui_menuOpen && (imgui_is_window_focused() || imgui_any_focused() || imgui_any_active() || imgui_window_hovered() || imgui_item_hovered() || imgui_any_item_hovered())){
    global.editor_input_disabled = true
    gml_Script_scr_deactivate_input()
} else if(global.inspector_active && room == level_editor){
    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1920 * .7 + 2, 2, 1920 - 2, 1080 - 2)){
        prevMouseInInspector = true
        global.editor_input_disabled = true
        gml_Script_scr_deactivate_input()
    } else {
        prevMouseInInspector = false 
        global.editor_input_disabled = false
    }
} else if(global.global_inspector_active && room != menu){
    if(!point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 2, 2, 1920 - 2, 1080 - 2)){
        global.editor_input_disabled = true
        gml_Script_scr_deactivate_input()
    } else {
    global.editor_input_disabled = false
}
} else if(global.shellworks_imgui_menuOpen){
    global.editor_input_disabled = true
    global.input_virtualmouse_lbuttonpressed = 0
} else {
    global.editor_input_disabled = false
}

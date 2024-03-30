imgui_begin(label)
if(string_length(text) > 0)
    imgui_text(text)

if(extra_assets_func != -1){
    script_execute_ext(extra_assets_func, extra_assets_func_args, 0)
}

if(space_before_buttons){
    imgui_text(" ")
}

for(var i = 0; i < array_length(buttons); i++){
    var but = buttons[i]
    var butLabel = but[0]
    var butType = but[1]
    switch butType {

        case 0:
            if(gml_Script_shellworks_imgui_newbutton_doFunc(butLabel, gml_Script_shellworks_imgui_close_popup, [])){
            }
            break;

        case 1:
            var funcToCall = but[2]
            var funcArgs = but[3]
            if(gml_Script_shellworks_imgui_newbutton_doFunc(butLabel, funcToCall, funcArgs)){
                gml_Script_shellworks_imgui_close_popup()
            }
            break;

        case 2:
            var globalVarName = but[2]
            if(gml_Script_shellworks_imgui_newbutton_toggleVar(butLabel, globalVarName)){
                gml_Script_shellworks_imgui_close_popup()
            }
            break;
    }
    if(i < array_length(buttons) - 1){
        imgui_same_line()
    }
}

imgui_end()

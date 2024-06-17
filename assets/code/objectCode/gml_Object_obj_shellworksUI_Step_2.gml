if(prev_colorSchemeEditor_enabled != global.shellworks_imgui_colorSchemeEditor_open){
    if(global.setting_color_scheme <= MAX_OFFICIAL_COLORSCHEME){
        gml_Script_shellworks_imgui_createpopup_message("IMPORTANT WARNING!",
        "You are about to edit an OFFICIAL COLOR SCHEME! Be sure to press the one of the buttons from the \"NEW COLOR SCHEME\" menu if you don't want to override the official colors!",
        "I understand.")
    }
}


prev_colorSchemeEditor_enabled = global.shellworks_imgui_colorSchemeEditor_open

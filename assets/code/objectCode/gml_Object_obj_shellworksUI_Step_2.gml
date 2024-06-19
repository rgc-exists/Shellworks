if(prev_colorSchemeEditor_enabled != global.shellworks_imgui_colorSchemeEditor_open){
    /*
    if(global.setting_color_scheme <= MAX_OFFICIAL_COLORSCHEME){
        gml_Script_shellworks_imgui_createpopup_message("IMPORTANT WARNING!",
        "You currently have an OFFICIAL COLOR SCHEME selected! To edit colors, you will have to press the one of the buttons from the \"NEW COLOR SCHEME\" menu,\nOR you can select an unofficial color scheme from the menu to edit it.",
        "I understand.")
    }
    */
    //This is now replaced with an UNCLOSEABLE message that only goes away when an unofficial scheme is selected.
}


prev_colorSchemeEditor_enabled = global.shellworks_imgui_colorSchemeEditor_open

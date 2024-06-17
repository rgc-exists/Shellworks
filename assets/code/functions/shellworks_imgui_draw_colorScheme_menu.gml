
theme_type = "Normal"
theme_path = "Normal.txt"

if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler){
    theme_type = "Normal"
    theme_path = "Normal.txt"
} else if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler_brain){
    theme_type = "Brain"
    theme_path = "Brain.txt"
} else if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler_disco){
    theme_type = "Disco"
    theme_path = "Disco.txt"
} else if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler_underwater){
    theme_type = "Underwater"
    theme_path = "Underwater.txt"
} else if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler_winter){
    theme_type = "Winter"
    theme_path = "Winter.txt"
} else if(instance_nearest(0, 0, obj_levelstyler).object_index == obj_levelstyler_bubblegum){
    theme_type = "Bubblegum"
    theme_path = "Bubblegum.txt"
}

imgui_begin("NEW COLOR SCHEME")
gml_Script_shellworks_imgui_newbutton_doFunc("New MODERN Scheme", gml_Script_scr_copy_color_scheme, [1])
gml_Script_shellworks_imgui_newbutton_doFunc("New CLASSIC Scheme", gml_Script_scr_copy_color_scheme, [2])
gml_Script_shellworks_imgui_newbutton_doFunc("New MINIMALIST Scheme", gml_Script_scr_copy_color_scheme, [3])
gml_Script_shellworks_imgui_newbutton_doFunc("Copy Current Scheme", gml_Script_scr_copy_color_scheme, [global.setting_color_scheme])

imgui_end()


imgui_begin("SAVE/LOAD COLOR SCHEME")
gml_Script_shellworks_imgui_newbutton_doFunc("Apply Selected Colors", gml_Script_scr_apply_selected_colors, [])
gml_Script_shellworks_imgui_newbutton_doFunc("Save Color Scheme", gml_Script_scr_save_color_scheme, [theme_type])
imgui_end()

imgui_begin("CURRENT THEME")
imgui_text("IMPORTANT: The colors in this menu will only change for the room type you are in,\nThis includes the theme, such as underwater/bubblegum,\nand SOMETIMES whether or not the level is \"dark\"")

imgui_separator_text("Current Theme Info")
imgui_text("Level theme: " + theme_type)
var dark_light_txt = "Light"
if(instance_exists(obj_dark_level)) dark_light_txt = "Dark"
imgui_text("Dark/light: " + dark_light_txt)
override_txt = "(NONE)"
imgui_text("Override: " + override_txt)
imgui_end()


imgui_begin("WALLS")

imgui_separator_text("Colors")

if(!instance_exists(obj_dark_level)){
    gml_Script_shellworks_imgui_newcolorpicker("Wall A", "col_wall_A_selected")
    gml_Script_shellworks_imgui_newcolorpicker("Wall B", "col_wall_B_selected")
} else {
    gml_Script_shellworks_imgui_newcolorpicker("Wall A DARK", "col_wall_A_dark_selected")
    gml_Script_shellworks_imgui_newcolorpicker("Wall B DARK", "col_wall_B_dark_selected")
}
gml_Script_shellworks_imgui_newcolorpicker("Wall Outline A", "col_wall_outline_selected")
gml_Script_shellworks_imgui_newcolorpicker("Wall Outline B", "col_wall_outline2_selected")

gml_Script_shellworks_imgui_newreal("Brightness in Darkness", "walls_brightness_when_lights_are_out_selected")

imgui_end()

imgui_begin("BACKGROUND")

imgui_separator_text("Colors")

if(!instance_exists(obj_dark_level)){
    gml_Script_shellworks_imgui_newcolorpicker("Background", "col_back_selected")
    gml_Script_shellworks_imgui_newcolorpicker("Background Pattern", "col_back_pattern_selected")
} else {
    gml_Script_shellworks_imgui_newcolorpicker("Background (DARK)", "col_back_in_darkness_selected")
    gml_Script_shellworks_imgui_newcolorpicker("Background Pattern (DARK)", "col_back_pattern_in_darkness_selected")
}

imgui_separator_text("Settings")
gml_Script_shellworks_imgui_newreal("Minimum Background Size", "background_size_min_selected")
gml_Script_shellworks_imgui_newreal("Maximum Background Size", "background_size_max_selected")

gml_Script_shellworks_imgui_newslider("Background Style", "background_style_selected", 0, 19, false, false, 1)

gml_Script_shellworks_imgui_newreal("Minimum Parallax", "background_parallax_min_selected")
gml_Script_shellworks_imgui_newreal("Maximum Parallax", "background_parallax_max_selected")

gml_Script_shellworks_imgui_newreal("Minimum Scroll Speed", "background_scroll_speed_min_selected")
gml_Script_shellworks_imgui_newreal("Maximum Scroll Speed", "background_scroll_speed_selected")

imgui_end()


imgui_begin("ENEMIES/ENTITIES")
imgui_separator_text("Enemies")
gml_Script_shellworks_imgui_newcolorpicker("Enemies", "col_traps_selected")
gml_Script_shellworks_imgui_newcolorpicker("Enemy Warnings", "col_spike_warning_selected")
gml_Script_shellworks_imgui_newcolorpicker("Enemy Warnings", "col_spike_warning_selected")


imgui_separator_text("Objects")
gml_Script_shellworks_imgui_newcolorpicker("Conveyor Belts", "col_conveyor_belts_selected")
gml_Script_shellworks_imgui_newcolorpicker("Bubbles", "col_bubbles_selected_selected")
gml_Script_shellworks_imgui_newcolorpicker("Underwater Currents", "col_underw_currents_selected")

imgui_separator_text("Tower Defense")
gml_Script_shellworks_imgui_newcolorpicker("Basic Turret", "col_td_turret_1_selected")
gml_Script_shellworks_imgui_newcolorpicker("Sniper Turret", "col_td_turret_2_selected")
gml_Script_shellworks_imgui_newcolorpicker("Splash Turret", "col_td_turret_3_selected")

imgui_separator_text("Boss Colors")
gml_Script_shellworks_imgui_newcolorpicker("FinalBoss Part1 A", "col_finalboss_1a_selected")
gml_Script_shellworks_imgui_newcolorpicker("FinalBoss Part1 B", "col_finalboss_1b_selected")
gml_Script_shellworks_imgui_newcolorpicker("FinalBoss Part2 A", "col_finalboss_2_selected")
gml_Script_shellworks_imgui_newcolorpicker("FinalBoss Part2 B", "col_finalboss_3_selected")


imgui_end()


imgui_begin("MISCELLANEOUS")

imgui_separator_text("AI Colors")

gml_Script_shellworks_imgui_newcolorpicker("AI A", "col_ai_selected")
gml_Script_shellworks_imgui_newcolorpicker("AI B", "col_ai2_selected")
gml_Script_shellworks_imgui_newcolorpicker("AI In Background", "col_ai_inback_selected")

imgui_separator_text("Level Select")
gml_Script_shellworks_imgui_newcolorpicker("Portal Locked Front", "col_lvlselect_lvl_locked_front_selected")
gml_Script_shellworks_imgui_newcolorpicker("Portal Locked Back", "col_lvlselect_lvl_locked_back_selected")
gml_Script_shellworks_imgui_newcolorpicker("Portal Normal Back", "col_lvlselect_lvl_normal_front_selected")
gml_Script_shellworks_imgui_newcolorpicker("Portal Normal Back", "col_lvlselect_lvl_normal_back_selected")
gml_Script_shellworks_imgui_newcolorpicker("Portal Story Back", "col_lvlselect_lvl_story_back_selected")
gml_Script_shellworks_imgui_newcolorpicker("Portal Story Back", "col_lvlselect_lvl_story_front_selected")
gml_Script_shellworks_imgui_newcolorpicker("Portal Secret Back", "col_lvlselect_lvl_secret_back_selected")
gml_Script_shellworks_imgui_newcolorpicker("Portal Secret Back", "col_lvlselect_lvl_secret_front_selected")
gml_Script_shellworks_imgui_newcolorpicker("QuestionMark Indicator", "col_lvlselect_moretoexplore_arrow_selected_2") //Named this way because "col_lvlselect_moretoexplore_arrow_selected" is already used in the game.
gml_Script_shellworks_imgui_newcolorpicker("Selected QuestionMark Indicator", "col_lvlselect_moretoexplore_arrow_selected_selected") //Yes, this intentionally has selected_selected.

imgui_separator_text("Misc. Colors")
gml_Script_shellworks_imgui_newcolorpicker("Dialog Files", "col_dialog_files_selected")
gml_Script_shellworks_imgui_newcolorpicker("Dallin", "col_dallin_selected")
gml_Script_shellworks_imgui_newcolorpicker("Unicorn", "col_unicorn_selected")



imgui_end()

imgui_begin("SEPARATE MENUS")

gml_Script_shellworks_imgui_newbutton_toggleVar("Main Shellworks Menu", "shellworks_imgui_colorSchemeEditor_open")


imgui_end()

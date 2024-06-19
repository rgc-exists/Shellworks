levelstyler_local_colors =  [
    "Background", "col_back",
    "BackgroundPattern", "col_back_pattern",
    "BackgroundInDarkness", "col_back_in_darkness",
    "BackgroundPatternInDarkness", "col_back_pattern_in_darkness",
    "WallA", "col_wall_A",
    "WallB", "col_wall_B",
    "WallADark", "col_wall_A_dark",
    "WallBDark", "col_wall_B_dark",
    "WallOutlineA", "col_wall_outline",
    "WallOutlineB", "col_wall_outline2",
    "AIA", "col_ai",
    "AIB", "col_ai2",
    "SnailGlow", "col_snail",
    "SnailDeath", "col_snail_death",
    "SnailTrail", "col_player_trail",
    "Enemies", "col_traps",
    "EnemyWarnings", "col_spike_warning",
    "SnailOutline", "col_snail_outline",
    "SnailBody", "col_snail_body",
    "SnailShell", "col_snail_shell",
    "SnailEye", "col_snail_eye",
    "Dallin", "col_dallin",
    "DialogFiles", "col_dialog_files",
    "Bubbles", "col_bubbles",
    "UnderwCurrents", "col_underw_currents",
    "SnailFlare", "col_underw_currents",
    "SnailFlare", "col_snail_flare",
    "AIInBackground", "col_ai_inback",
    "LightOcean", "col_light_ocean",
    "ConveyorBelts", "col_conveyor_belts",
    "FinalBoss1A", "col_finalboss_1a",
    "FinalBoss1B", "col_finalboss_1b",
    "FinalBoss2", "col_finalboss_2",
    "FinalBoss3", "col_finalboss_3",
    "TDTurret1", "col_td_turret_1",
    "TDTurret2", "col_td_turret_2",
    "TDTurret3", "col_td_turret_3",
    "ExplorationPoints", "col_exploration_point",
    "CorruptedAntenna", "col_currupted_antenna",
    "DialogFileOverlay", "col_dialog_file_overlay",
    "Doors", "col_doors",
    "Unicorn", "col_unicorn",
    "Smiley1", "col_smiley_1",
    "Smiley2", "col_smiley_2",
    "PlayerSpotlight", "col_player_spotlight",
    "PlayerSpotlightDark", "col_player_spotlight_dark"
]

global_colors = [
    "LvlLockedFront", "col_lvlselect_lvl_locked_front",
    "LvlLockedBack", "col_lvlselect_lvl_locked_back",
    "LvlNormalFront", "col_lvlselect_lvl_normal_front",
    "LvlNormalBack", "col_lvlselect_lvl_normal_back",
    "LvlStoryFront", "col_lvlselect_lvl_story_front",
    "LvlStoryBack", "col_lvlselect_lvl_story_back",
    "LvlSecretFront", "col_lvlselect_lvl_secret_front",
    "LvlSecretBack", "col_lvlselect_lvl_secret_back",
    "LvlQuestionmarkIndicator", "col_lvlselect_moretoexplore_arrow",
    "LvlQuestionmarkIndicatorSelected", "col_lvlselect_moretoexplore_arrow_selected",
    "BloomColor", "pp_bloom_color"

]

global_threepartcolors = [
    "PostProcessingContrast", ["pp_curve_strength_r", "pp_curve_strength_g", "pp_curve_strength_b"],
    "PostProcessingContrastOffset", ["pp_curve_mid_r", "pp_curve_mid_g", "pp_curve_mid_b"]
]

global_threeparts_butnormal_colors = [
    "OverlayGradientColorTop", ["pp_curve_ol_top_r", "pp_curve_ol_top_g", "pp_curve_ol_top_b"],
    "OverlayGradientColorBot", ["pp_curve_ol_bot_r", "pp_curve_ol_bot_g", "pp_curve_ol_bot_b"],
    "OverlayVignetteColor", ["pp_curve_ol_bot_r", "pp_curve_ol_bot_g", "pp_curve_vignette_b"]
]


global_reals = [
    "OverlayVignetteAlpha", "pp_curve_vignette_a",
    "OverlayVignetteSize", "pp_curve_vignette_size",
    "BloomAlpha", "pp_bloom_strength",
    "WallBrightnessWhenLightsAreOut", "walls_brightness_when_lights_are_out",
    "DiscoLightHueOffset", "col_disco_light_hue_offset",
    "DiscoLightHueSpread", "col_disco_light_hue_spread",
    "DiscoLightSaturation", "col_disco_light_saturation",
    "DiscoLightAlpha", "col_disco_light_alpha"
]

levelstyler_local_reals = [
    "ColorRotationAllowed", "color_rotation_allowed",
    "HueShiftAllColors", "hueshift_all",
    "BackgroundScaleMin", "background_size_min",
    "BackgroundScaleMax", "background_size_max",
    "BackgroundStyle", "background_style",
    "BackgroundParallaxMin", "background_parallax_min",
    "BackgroundParallaxMax", "background_parallax_max",
    "BackgroundScrollSpeedMax", "background_scroll_speed",
    "BackgroundScrollSpeedMin", "background_scroll_speed_min",
    "MinimalistColorMode", "minimalist_color_mode"
]

database = [
    "levelstyler_local_colors", gml_Script_shellworks_modhelper_array_to_struct(levelstyler_local_colors),
    "global_colors", gml_Script_shellworks_modhelper_array_to_struct(global_colors),
    "global_threepartcolors", gml_Script_shellworks_modhelper_array_to_struct(global_threepartcolors),
    "global_threeparts_butnormal_colors", gml_Script_shellworks_modhelper_array_to_struct(global_threeparts_butnormal_colors),
    "global_reals", gml_Script_shellworks_modhelper_array_to_struct(global_reals),
    "levelstyler_local_reals", gml_Script_shellworks_modhelper_array_to_struct(levelstyler_local_reals)
]
global.color_scheme_database = gml_Script_shellworks_modhelper_array_to_struct(database)






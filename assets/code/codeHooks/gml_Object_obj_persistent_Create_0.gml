
global.is_BSE_client = true
//This is for  if any other mods want to make their code "support" BSE by making it compatible if it detects a BSE client.
//Just use if(variable_global_exists("is_BSE_client")) to detect if it's BSE or not.
//Sorry for anyone that needs to detect whether or not it's BSE before obj_persistent_Create_0 is run, I couldn't figure out how to get global init scripts to work with GMML.

global.BSE_version_patch = "v1.2.0-BETA3"
global.BSE_version_GS2ML = "v1.2.0-BETA3"
global.check_BSE_version_on_github = false

if(directory_exists(working_directory + "gs2ml/mods/Shellworks/Shellworks_Assets/")){
    global.betterSE_assets = working_directory + "gs2ml/mods/Shellworks/Shellworks_Assets/"
    global.is_gmml_version = true
    global.BSE_version = global.BSE_version_GS2ML
} else if(directory_exists(working_directory + "gmsl/mods/Shellworks/Shellworks_Assets/")){
    global.betterSE_assets = working_directory + "gmsl/mods/Shellworks/Shellworks_Assets/"
    global.is_gmml_version = true
    global.BSE_version = global.BSE_version_GS2ML
} else if(directory_exists(working_directory + "Shellworks_Assets/")){
    global.betterSE_assets = working_directory + "Shellworks_Assets/"
    global.is_gmml_version = false
    global.BSE_version = global.BSE_version_patch
} else {
    show_error("SHELLWORKS ERROR:\nThe assets folder for the mod was not found.\nPlease add the folder called 'Shellworks_Assets' to the same folder as the Will You Snail executable\n(your WYS steam install location.)\n\nThe folder can be found in the zip file you downloaded the mod with.\n\nAs for GS2ML users, IDK how you messed this up, the required folder should already be inside the folder you put in the gs2ml/mods folder.", true)
}

global.model_tool_sprite = sprite_add(global.betterSE_assets + "sprites/" + "spr_models_tool_v3.png", 0, 0, 0, 0, 0)
global.inspector_tool_sprite = sprite_add(global.betterSE_assets + "sprites/" + "inspector_tool_v2.png", 0, 0, 0, 0, 0)
global.ruler_tool_sprite = sprite_add(global.betterSE_assets + "sprites/" + "ruler_tool.png", 0, 0, 0, 0, 0)
global.king_snail_sprite = sprite_add(global.betterSE_assets + "sprites/" + "king_snail.png", 0, 0, 0, 36, 38)

if(!directory_exists(working_directory + "Shellworks_Temp")){
    directory_create(working_directory + "Shellworks_Temp")
}
if(global.check_BSE_version_on_github){
    if(global.is_gmml_version){
        version_file = http_get_file("https://raw.githubusercontent.com/rgc-exists/MysteriousVersionName/main/version.txt", "Shellworks_Temp\\version.txt")
    } else {
        version_file = http_get_file("https://raw.githubusercontent.com/rgc-exists/MysteriousVersionName/main/patchversion.txt", "Shellworks_Temp\\version.txt")
    }
}
if(global.is_gmml_version){
    //gmml_console_readline()
}


if(file_exists("SettoIngs23-2.set") && file_exists("Shellworks_SettoIngs23-2-2.set"))
    global.is_resetting_settings = 0
else if(file_exists("Shellworks_SettoIngs23-2.set")){
    global.is_resetting_settings = 1
}
else if(file_exists("SettoIngs23-2.set")){
    global.is_resetting_settings = 2
} else {
    global.is_resetting_settings = 1
}



global.invincible_mode = false
global.ball_invincible_mode = false
global.td_invincible_mode = false
global.fuse_invincible_mode = false
global.infinite_jumps = false


obj_persistent.show_hotkeys_tip = 0
global.hotkeys_shown = false
global.rendering_enabled = true
global.exits_in_this_level_are_available = true



global.cur_musroom_song = 1
global.cur_musroom_sound = -1
global.musroom_names = ["1 - Another Simulation", "2 - Jump And Die", "3 - Simulated Life", "4 - Quietly Searching", "5 - Let's Make It Pain", "6 - Admitting Defeat", "7 - Shelly Fire", "8 - Demolition Warning", "10 - Disco of Doom", "11 - Chill Zone", "12 - Mr Dance", "13 - Underwater", "14 - Mama Squid", "15 - Death by Nanobots", "16 - Helpy Loves You", "17 - Winter Mode", "18 - Artificial Joy", "19 - Tension", "20 - Final Encounter", "22 - Reality Diving", "23 - Hello AI Ft. Jason Hanes", "24 - Unicorn Victory", "25 - Supremacy", "26 - Brain Ambience", "27 - Artificial Winter", "28 - Another Simulation (Winter)", "29 - Level Editor Theme", "30 - Elevator Music", "[UNUSED]  Hello AI Ancestry", "[UNUSED]  Hello AI Ancestry Ft. Jason Hanes", "[UNUSED] Hello AI v1", "[UNOFFICIAL] Snailax Theme (By MissingTextureMan)", "[UNUSED PROTOTYPE] AnnoyingRageGameMusic.mp3 (By Yän)"]
global.musroom_songs = [sou_music_logo_theme, sou_music_main, sou_music_LightOcean, sou_music_silent, sou_music_LightPain, sou_music_NoHope, SnailCombat_02, sou_music_BlockyBoss, sou_music_disco, sou_music_disco_silent, sou_music_mrDance, sou_music_underwater, sou_music_MamaSquid, DeathByNanobots, sou_music_helpy, sou_music_winter, ArtificialFun, sou_music_tension, BossFightWIP_04, AwaitingTheHorizon, music_credits, BossVictoryJingle, sou_music_squid_kill, sou_InBrainAmbientLooped, ArtificialWinter, AnotherSimulation_Winter, sou_music_LevelEditor, sou_music_Elevator, audio_create_stream(global.betterSE_assets + "audio/" + "Hello AI Ancestry.ogg"), audio_create_stream(global.betterSE_assets + "audio/" + "Hello AI Ancestry Ft. Jason Hanes.ogg"), audio_create_stream(global.betterSE_assets + "audio/" + "Hello AI v1.ogg"), audio_create_stream(global.betterSE_assets + "audio/" + "Snailax Editor Theme.ogg"), audio_create_stream(global.betterSE_assets + "audio/" + "AnnoyingRageGameMusic.ogg")]
global.cheat_player_speed = 1
global.cheat_jump_height = 1

should_restart_after_exit_menu = 0


global.debugger_scroll = 50
global.debugger_scroll_speed = 40
global.object_search_selected = false
global.object_search_query = ""
global.inspector_selection = []

global.inspector_active = false

global.inspector_var_names_to_auto_get_at_start = ["x", "y", "image_xscale", "image_yscale", "image_angle"]
global.inspector_var_names_to_auto_get_at_end = []


global.global_inspector_active = false
global.global_inspector_selected_obj = -500
global.read_only_var_names = ["id", "object_index", "xprevious", "yprevious", "sprite_xoffset", "sprite_yoffset", "sprite_width", "sprite_height", "image_number", "mask_index", "bbox_top", "bbox_bottom", "bbox_left", "bbox_right", "path_positionprevious", "path_endaction", "in_sequence", "sequence_instance", "Physics"]
global.var_names_to_auto_get_at_start = ["x", "y", "image_xscale", "image_yscale", "image_angle"]
global.var_names_to_auto_get_at_end = ["sprite_index", "image_index", "image_speed", "image_alpha", "image_blend", "object_index", "visible", "solid", "persistent", "hspeed", "vspeed", "xprevious", "yprevious", "sprite_xoffset", "sprite_yoffset", "image_number", "depth", "layer", "alarm", "direction", "friction", "gravity", "gravity_direction", "id", "mask_index", "bbox_top", "bbox_bottom", "bbox_left", "bbox_right", "path_positionprevious", "path_endaction", "in_sequence", "sequence_instance", "Physics"]
global.recently_selected_objs = ds_list_create()

/*
[
    name,
    body,
    shell,
    outline,
    eye,
    death,
    spotlight
    spotlight_dark,
    flare,
    trail,
    hat
]
*/


global.preset_character_data = [
    [
        "Default Snail",
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -2
    ],
    [
        "Poop Snail",
        70,
        58,
        0,
        51,
        65535,
        32,
        13,
        26,
        23115,
        6
    ],
    [
        "Unicorn",
        real("9175180"),
        real("4915280"),
        real("2097180"),
        real("3342390"),
        real("16711900"),
        real("4194370"),
        real("1703960"),
        real("3342390"),
        real("8388740"),
        2
    ],
    [
        "Festive Shelly",
        140,
        29440,
        32,
        -1,
        65535,
        16448,
        6682,
        13107,
        32896,
        4
    ],
    [
        "Prototype Shelly",
        35980,
        real("1919090"),
        0,
        -1,
        65280,
        0,
        0,
        0,
        128,
        -2
    ]
]

prevMouseInInspector = false



gml_Script_scr_initialize_BSE_settings()

/*
show_message("Begin")
gml_Script_scr_initialize_betterIO()
show_message("A")
var f = gml_Script_OpenFileWrite(working_directory + "BetterIO_TestOutput.txt")
show_message(string(f))
show_message("B")
var stringWrittenOutput = gml_Script_WriteStringFile(f, "BALLS")
show_message("C")
show_message(stringWrittenOutput)
show_message("D")
gml_Script_CloseFileWrite(f)
show_message("E")
*/


global.snailax_editor_theme = audio_create_stream(global.betterSE_assets + "audio/" + "Snailax Editor Theme.ogg")

global.is_legit_right_now = true

global.player_is_dead = false

global.iDisplay_Up = [sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "UpOff.png", 0, 0, 0, 0, 0), sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "UpOn.png", 0, 0, 0, 0, 0)]
global.iDisplay_Down = [sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "DownOff.png", 0, 0, 0, 0, 0), sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "DownOn.png", 0, 0, 0, 0, 0)]
global.iDisplay_Left = [sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "LeftOff.png", 0, 0, 0, 0, 0), sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "LeftOn.png", 0, 0, 0, 0, 0)]
global.iDisplay_Right = [sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "RightOff.png", 0, 0, 0, 0, 0), sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "RightOn.png", 0, 0, 0, 0, 0)]
global.iDisplay_Q = [sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "QOff.png", 0, 0, 0, 0, 0), sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "QOn.png", 0, 0, 0, 0, 0)]
global.iDisplay_R = [sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "ROff.png", 0, 0, 0, 0, 0), sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "ROn.png", 0, 0, 0, 0, 0)]
global.iDisplay_Esc = [sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "EscOff.png", 0, 0, 0, 0, 0), sprite_add(global.betterSE_assets + "sprites/" + "Input display/" + "EscOn.png", 0, 0, 0, 0, 0)]

global.player_has_existed = false

global.spr_lvlico_auto = sprite_add(global.betterSE_assets + "sprites/" + "spr_lvlico_auto.png", 0, 0, 0, 0, 0)


global.room_remember = room
global.player_exists_remember = 0

go_to_a_room_next = false
room_to_goto_next = -1

noclip_deathFX_fadeout = 0
noclip_fadeout_speed = 0.05

global.shellworks_imgui_menuOpen = false

global.shellworks_first_time = false
global.shellworks_first_menu_press = false
if(!file_exists("shellworks_hasBeenBootedUp.dontDelete")){
    global.shellworks_first_time = true
    global.shellworks_first_menu_press = true
    if(!variable_global_exists("has_persistentCreate0_run_already")){
        gml_Script_shellworks_imgui_createpopup_togglevar("WELCOME!",
        "Welcome to Shellworks!\n\n\nBy default, you can press F4 to enter the shellworks menu.\n\nThe menu open key can be changed in the vanilla menu just like any other keybind.",
        "shellworks_first_time")
    }
}

global.manual_textbox_selected = false

#orig#()

global.has_persistentCreate0_run_already = true
//For some reason certain things in persistent_create_0 run twice... Don't ask me why, GameMaker is wack.



global.enable_dangerous_test_features = true

global.save_speedrun_timer_attempt = 0

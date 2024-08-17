//BE SURE TO PERSIST OBJECTS' ALARMS!
var database = [
    "Local", [
    gml_Script_shellworks_modhelper_array_to_struct([
        "obj_player", [
            "dragging_power_connection", "speed_mult", "gun_equipped", "gun_cooldown", "snail_voice_sound",
            "reading_file", "lookdir", "lookdir_start", "lookdir_smooth", "victory", "dead", "particletraveldist", 
            "xlast", "ylast", "x", "y", "nomovement_timer", "house_height", "house_width", "house_tilt",
            "lockmovement", "wind_sound_fall_volume", "wind_sound_slither_volume", "winter",
            "time", "active_time", "inbubble_flash", "hspeed_last", "in_water_current", "bubbleindicator",
            "allow_restarts", "bonus_speed_by_conveyor", "extra_speed_mode", "started_playing",
            "holding_jump_without_moving_timer", "glitch_mode_and_dir", "speedboosted", "speedboosted_grace_period",
            "max_smilies", "collected_smilies", "smilie_counters_played", "infinijumptime", "handled_custom_exit",
            "first_spawn_in_community", "underwater", "lookdir_smooth", "slither_active", "reading_file",
            "override_lookdir", "groundedremember", "holding_jump_without_moving_timer", "particletraveldist",
            "jumpremember", "airjumps", "timesincelastjump", "inbubble", 
        ]
    ])
    ],
    "Global", [
        "player_using_glitch_timer"
    ]
]

global.checkpoint_database = gml_Script_shellworks_modhelper_array_to_struct(database)
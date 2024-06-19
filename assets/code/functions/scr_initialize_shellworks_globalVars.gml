

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
global.player_exists_remember = false

global.shellworks_imgui_colorSchemeEditor_open = false

global.just_applied_colors = false
global.just_copied_color_scheme = false
global.prev_theme_type = ""
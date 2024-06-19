
obj_camera_control.camx = obj_player.x + 120
obj_camera_control.camy = obj_player.y
obj_camera_control.targetx = obj_player.x + 120
obj_camera_control.targety = obj_player.y

draw_set_alpha(1)
draw_set_color(c_ltgray)
draw_rectangle(640, 100, 1850, 950, false)

mouseX = device_mouse_x_to_gui(0)
mouseY = device_mouse_y_to_gui(0)

draw_set_alpha(1)

var name = menus_data[selected_menu][0]
var globalVar = menus_data[selected_menu][1]
var darkblend = menus_data[selected_menu][2]

var colorsPerRow = 5
var colButX = 1
var colButY = 0
var xScale = 60
var yScale = 60
var xSpacing = 90
var ySpacing = 90
for(var c = 1; c < array_length(possible_colors); c++){
    while(c < array_length(possible_colors) && colButX < colorsPerRow){
        var x1 = 690 + (colButX * xSpacing)
        var y1 = 150 + (colButY * ySpacing)
        var x2 = x1 + xScale
        var y2 = y1 + yScale
        var text_color = c_black
        if(color_get_value(possible_colors[c]) < 50){
            text_color = c_white
        }
        curExistingColor = variable_global_get(globalVar)

        var outline_color = c_black
        if(merge_color(possible_colors[c], c_black, darkblend) == curExistingColor)
            outline_color = c_white

        var isPressed = gml_Script_scr_color_button(
            x1, y1, x2, y2,
            possible_colors[c],
            globalVar,
            "", text_color,
            outline_color
        )

        if(isPressed){
            variable_global_set(globalVar, merge_color(possible_colors[c], c_black, darkblend))
            with(obj_player) event_user(0)
            scr_save_settings()
            with (obj_fx_constant){
                if(global.setting_player_trail == -1){
                    col_player_trail_idk = obj_levelstyler.col_player_trail
                } else {
                    col_player_trail_idk = global.setting_player_trail
                }
            }
            if(global.setting_player_trail == -1){
                col_player_trail_idk = obj_levelstyler.col_player_trail
            } else {
                col_player_trail_idk = global.setting_player_trail
            }
            part_type_color1(global.part_type_playerTrail, col_player_trail_idk)
        }

        c++;
        colButX++;
    }
    colButY++;
    colButX = 0
}

var x1 = 690
var y1 = 150
var x2 = x1 + xScale
var y2 = y1 + yScale
var text_color = c_black

var isPressed = gml_Script_scr_color_button_default(
    x1, y1, x2, y2,
    c_ltgray,
    globalVar,
    "DEFAULT", text_color
)
if(isPressed){
    variable_global_set(globalVar, -1)
    with(obj_player) event_user(0)
    with (obj_fx_constant){
        if(global.setting_player_trail == -1){
            col_player_trail_idk = obj_levelstyler.col_player_trail
        } else {
            col_player_trail_idk = global.setting_player_trail
        }
        if(global.setting_player_trail == -1){
            col_player_trail_idk = obj_levelstyler.col_player_trail
        } else {
            col_player_trail_idk = global.setting_player_trail
        }
        part_type_color1(global.part_type_playerTrail, col_player_trail_idk)
    }
    scr_save_settings()
}

var xPos = 690 + (colorsPerRow * xSpacing) + xSpacing
var yPos = 150
for(var md = 0; md < array_length(menus_data); md++){
    var menu_name = menus_data[md][0]
    var menu_globalVar = menus_data[md][1]
    var menu_darkblend = menus_data[md][2]

    var x1 = xPos
    var y1 = yPos + (md * ySpacing)
    var x2 = x1 + xScale * 3
    var y2 = y1 + yScale

    var outline_color = c_black
    if(selected_menu == md){
        outline_color = c_white
    }

    var isCategoryPressed = gml_Script_scr_color_basic_text_button(
        x1, y1, x2, y2,
        c_ltgray,
        globalVar,
        menu_name, c_black,
        outline_color
    )
    
    if(isCategoryPressed){
        selected_menu = md
    }
}


draw_set_color(c_white)
draw_set_alpha(1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_transformed(10, 10, "NOTE: This UI is deprecated and can often lead to way brighter colors than expected.\nAlso, it does not have a way to see colors that only apply in NON-DARK levels.\nPreferably use the color sliders in the Shellworks mod menu overlay.", 1, 1, 0)

draw_set_alpha(0.7)
draw_set_color(c_green)
draw_arrow(mouseX + 30, mouseY + 45, mouseX, mouseY, 140)
z += zspeed * global.setting_intense_backgrounds
z = clamp(z, maxdist, 1)
xxx = (x + ((obj_camera_control.camx - x) * z))
yyy = (y + ((obj_camera_control.camy - y) * z))
sc = ((image_xscale / (1 + z)) * 0.5)
if (global.light_suffering <= 0)
{
    if (global.setting_visual_details != 0)
        draw_sprite_ext(spr_light_ocean_mini, image_index, xxx, yyy, sc, sc, (image_angle + universe_angle), inside_col, (1 - z))
    sc *= 2
    draw_sprite_ext(sprite_index, image_index, xxx, yyy, sc, sc, image_angle, image_blend, (1 - z) - ((1 - global.setting_intense_backgrounds) * .5))
}
else
{
    if (random(1) < 0.01)
        z = 1
    xxx += (random(20) - 40)
    yyy += (random(20) - 40)
    image_angle += ((random(10) - 5) * global.setting_intense_backgrounds) + random(1)
    col = merge_color(image_blend, make_color_rgb(255, 155, 155), global.light_suffering)
    if (global.setting_visual_details != 0)
        draw_sprite_ext(spr_light_ocean_mini, image_index, xxx, yyy, sc, sc, (image_angle + universe_angle), col, (1 - z))
    sc *= 2
    draw_sprite_ext(sprite_index, image_index, xxx, yyy, sc, sc, image_angle, col, (1 - z) - ((1 - global.setting_intense_backgrounds) * .5))
}

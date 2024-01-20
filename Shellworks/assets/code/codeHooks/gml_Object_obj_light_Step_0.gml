if (global.setting_visual_details < required_visual_detail)
{
    return false;
}
image_blend = obj_light_ocean_background.image_blend
roti = (((scr_sin_fast_plus((x / 100)) + scr_sin_fast_plus((y / 100))) * 1) * (1 + (global.light_suffering * 3)))
if(global.setting_intense_backgrounds > .2){
    direction += roti * global.setting_intense_backgrounds
    image_angle += (roti * 2)
}
speed = (1 + (global.light_suffering * 3)) * global.setting_intense_backgrounds
if (random(1) < (global.light_suffering * 0.04))
{
    x += (300 - random(600)) * global.setting_intense_backgrounds
    y += (300 - random(600)) * global.setting_intense_backgrounds
}
if (x < -100)
    x += (room_width + 200) * global.setting_intense_backgrounds
if (y < -100)
    y += (room_height + 200) * global.setting_intense_backgrounds
if (x > (room_width + 100))
    x -= (room_width + 200) * global.setting_intense_backgrounds
if (y > (room_height + 100))
    y -= (room_height + 200) * global.setting_intense_backgrounds

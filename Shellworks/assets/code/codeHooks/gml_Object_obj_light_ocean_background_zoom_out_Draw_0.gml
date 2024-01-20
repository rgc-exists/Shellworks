image_blend = merge_color(original_col, make_color_rgb(255, 155, 155), global.light_suffering)
loop_size = 14
loop_offset = (loop_size / 2)
time -= ((1 + (global.light_suffering * 3)) * global.setting_intense_backgrounds) + .1
if(global.setting_intense_backgrounds <= 0.5){
    darkness_amount = 0.5 - global.setting_intense_backgrounds
}
camx = obj_camera_control.camx
camy = obj_camera_control.camy
size = ((obj_camera_control.cam_zoom * 0.05) * power(1.5, (((time * zoom_speed) / 60) % loop_size)))
univers_alpha = min(1, ((1 - (abs(((((time * zoom_speed) / 60) % loop_size) - loop_offset)) / loop_offset)) * 10))
if (random(1) < (global.light_suffering * 0.1))
    rotation = random(360)
if (random(1) < ((1 - global.light_suffering) * 0.1))
    rotation = 0
global.screenshake = max(global.screenshake, (global.light_suffering * 20))
with (obj_player)
    gamepad_rumble = max((gamepad_rumble * 0.9), (global.light_suffering * 0.5))
if (global.setting_visual_details == 0)
{
    xshake = ((5 - random(10)) * global.light_suffering)
    yshake = ((5 - random(10)) * global.light_suffering)
    draw_sprite_ext(spr_light_ocean_4, 0, (camx + xshake), (camy + yshake), size, size, (rotation * 0.25), image_blend, univers_alpha)
    loff = 0.5
    squares_size = (((obj_camera_control.cam_zoom * 0.05) * power(1.5, ((((time * zoom_speed) / 60) + (loop_offset * loff)) % loop_size))) / power(1.5, (loop_offset * loff)))
    square_alpha = ((abs(((((time * zoom_speed) / 60) + (loop_offset * loff)) % loop_size)) / loop_size) * 10)
    color_blend = ((abs(((((time * zoom_speed) / 60) + (loop_offset * loff)) % loop_size)) / loop_size) * 2)
    square_color = merge_color(merge_color(obj_levelstyler.col_snail, c_white, (clamp(color_blend, 0, 1) * 0.5)), c_black, darkness_amount * .75)
    draw_sprite_ext(spr_universe_square, 0, (camx + xshake), (camy + yshake), (squares_size * 18), (squares_size * 18), (rotation * 0.25), square_color, square_alpha)
}
else
{
    gpu_set_tex_repeat(1)
    gpu_set_texfilter(true)
    shader_set(shd_parallax)
    xshake = ((20 - random(40)) * global.light_suffering)
    yshake = ((20 - random(40)) * global.light_suffering)
    xoff = (xshake * 0.0001)
    yoff = (yshake * 0.0001)
    shader_set_uniform_f(u_vOffset, xoff, yoff)
    draw_sprite_ext(spr_light_ocean_4, 0, camx, camy, size, size, (rotation * 0.25), image_blend, univers_alpha)
    if (global.setting_visual_details >= 1)
    {
        xshake = ((20 - random(40)) * global.light_suffering)
        yshake = ((20 - random(40)) * global.light_suffering)
        xoff = ((((camx - time) + (sin((time / 30)) * 15)) + xshake) * 0.0001)
        yoff = ((((camy + time) + (sin((time / 23)) * 13)) + yshake) * 0.0001)
        shader_set_uniform_f(u_vOffset, xoff, yoff)
        draw_sprite_ext(spr_light_ocean_3, 0, camx, camy, size, size, ((-rotation) * 0.5), image_blend, univers_alpha)
    }
    if (global.setting_visual_details >= 2)
    {
        xshake = ((20 - random(40)) * global.light_suffering)
        yshake = ((20 - random(40)) * global.light_suffering)
        xoff = ((((camx - time) + (sin((time / 38)) * 17)) + xshake) * 0.0002)
        yoff = ((((camy + time) + (sin((time / 30)) * 15)) + yshake) * 0.0002)
        shader_set_uniform_f(u_vOffset, xoff, yoff)
        draw_sprite_ext(spr_light_ocean_2, 0, camx, camy, size, size, (rotation * 0.75), image_blend, univers_alpha)
    }
    if (global.setting_visual_details >= 3)
    {
        xshake = ((20 - random(40)) * global.light_suffering)
        yshake = ((20 - random(40)) * global.light_suffering)
        xoff = ((((camx - time) + (sin((time / 33)) * 14)) + xshake) * 0.0004)
        yoff = ((((camy + time) + (sin((time / 44)) * 15)) + yshake) * 0.0004)
        shader_set_uniform_f(u_vOffset, xoff, yoff)
        draw_sprite_ext(spr_light_ocean_1, 0, camx, camy, size, size, (-rotation), image_blend, univers_alpha)
    }
    shader_reset()
    shader_set(shd_tiled_from_center)
    loff = 0.5
    squares_size = (((obj_camera_control.cam_zoom * 0.05) * power(1.5, ((((time * zoom_speed) / 60) + (loop_offset * loff)) % loop_size))) / power(1.5, (loop_offset * loff)))
    square_alpha = ((abs(((((time * zoom_speed) / 60) + (loop_offset * loff)) % loop_size)) / loop_size) * 10)
    color_blend = ((abs(((((time * zoom_speed) / 60) + (loop_offset * loff)) % loop_size)) / loop_size) * 2)
    square_color = merge_color(obj_levelstyler.col_snail, c_white, (clamp(color_blend, 0, 1) * 0.5))
    shader_set_uniform_f(u_fZoom, (1 / squares_size))
    sprite_size = (obj_camera_control.cam_zoom * 2)
    draw_sprite_ext(spr_universe_square, 0, camx, camy, (sprite_size * 12), (sprite_size * 12), (-rotation), square_color, square_alpha)
    shader_reset()
    gpu_set_texfilter(false)
}

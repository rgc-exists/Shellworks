if(global.credits_mode == 100){
    if(file_exists(global.betterSE_assets + "videos/BSE credits.mp4")){
        var vidData = video_draw()
        var vidStatus = vidData[0]
        if(vidStatus == 0){
            //draw_surface_stretched(vidData[1], 0, 0, window_get_width(), window_get_height())
            draw_surface_stretched(vidData[1], 0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
        } else {
            with (obj_event_horizon_final)
                instance_destroy()
            global.music_pitch = 1
            global.music_volume = 1
            if (global.credits_mode == 2)
                scr_fade_to_room(136)
            else if (global.save_exploration_mode == 0 && scr_level_dat_get_beaten_on_diff(5) < 0)
                scr_fade_to_room(5)
            else
                scr_fade_to_room(134)
        }
    }
}
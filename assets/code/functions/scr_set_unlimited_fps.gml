obj_persistent.unlimited_frame_rate = argument0
if(unlimited_frame_rate){
    obj_persistent.ffps = 999999
    obj_persistent.smooth_fps = 999999
} else {
    obj_persistent.ffps = 60
    obj_persistent.smooth_fps = 100
}
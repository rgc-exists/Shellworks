global.aprilfools_video_paths = []

global.ads_videos_path = global.betterSE_assets + "videos/april_fools_ads/"


var filename = file_find_first(global.ads_videos_path + "*.mp4", fa_none)
while(filename != ""){
    array_push(global.aprilfools_video_paths, global.ads_videos_path + filename)

    filename = file_find_next()
}
file_find_close()

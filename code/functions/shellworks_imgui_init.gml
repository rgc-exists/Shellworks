var os_info = os_get_info()
global.imgui_hwnd = window_handle()
global.imgui_device = ds_map_find_value(os_info, "video_d3d11_device")
global.imgui_context = ds_map_find_value(os_info, "video_d3d11_context")

imgui_init(global.imgui_hwnd, global.imgui_device, global.imgui_context)



global.imgui_test_real = 0
global.imgui_test_string = ""
global.imgui_test_bool = false
global.test_checkbox_is_checked = false
global.shellworks_imgui_menuOpen = false
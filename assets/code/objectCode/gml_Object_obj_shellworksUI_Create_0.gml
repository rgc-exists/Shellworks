if (os_type == os_windows)
{
    gml_Script_shellworks_imgui_init()
    imgui_no_keyboard()
} else {
    show_error("SHELLWORKS ERROR:\nYou must be on Windows to use Shellworks due to its use of ImGUI.", true)
}
global.shellworks_imgui_time_menu_open = 0

popup_open = true

label = "UNTITLED POPUP"
text = "ERROR. THIS POPUP HAS NOT BEEN WRITTEN YET."

extra_assets_func = -1
extra_assets_func_args = []

space_before_buttons = true

buttons = [
    [
        "OK", //Label
        0 //Type (0 = close the popup)
    ]
]

just_drew = false

/*
BUTTON TYPE 0
[
    "OK", //Label
    0 //Type (0 = close the popup)
]

BUTTON TYPE 1
[
    "OK", //Label
    1, //Type (1 = call a function)
    gml_Script_shellworks_imgui_close_popup, //Function to run
    [] //Function arguments
]

BUTTON TYPE 2
[
    "OK", //Label
    2, //Type (2 = toggle a boolean global variable)
    global_var_name, //Global variable name
]
*/

my_popup_id = -1
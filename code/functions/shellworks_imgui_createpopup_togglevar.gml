var popupLabel = argument0
var popupText = argument1 
var globalVarName = argument2
var confirmButton = argument3
var doCancelButton = argument4
var cancelButton = argument5

if(confirmButton == undefined)
    confirmButton = "OKAY"
if(doCancelButton == undefined)
    doCancelButton = false
if(cancelButton == undefined)
    cancelButton = "CANCEL"


var popup = instance_create_layer(0, 0, "FadeOutIn", obj_shellworksUI_popup)

with(popup){
    label = popupLabel
    text = popupText

    buttons = [
        [
            confirmButton, //Label
            2, //Type (2 = toggle a boolean global variable)
            globalVarName, //Global variable name
        ]
    ]

    if(doCancelButton){
        array_push(buttons, 
        [
            cancelButton,
            0
        ])
    }
}

return popup

var popupLabel = argument0
var popupText = argument1 
var confirmButton = argument2
var confirmFunction = argument3
var confirmArguments = argument4
var doCancelButton = argument5
var cancelButton = argument6
var cancelFunction = argument7
var cancelArguments = argument8 

if(confirmButton == undefined)
    confirmButton = "OKAY"
if(doCancelButton == undefined)
    doCancelButton = false
if(cancelButton == undefined)
    cancelButton = "CANCEL"
if(confirmArguments == undefined)
    confirmArguments = []
if(cancelArguments == undefined)
    cancelArguments = []


var popup = instance_create_layer(0, 0, "FadeOutIn", obj_shellworksUI_popup)

with(popup){
    label = popupLabel
    text = popupText

    buttons = [
        [
            confirmButton, //Label
            3, //Type (3 = run function)
            confirmFunction, //Function to be run.
            confirmArguments //Arguments to pass to function
        ]
    ]

    if(doCancelButton){
        if(is_undefined(cancelFunction)){
            array_push(buttons, 
            [
                cancelButton,
                0
            ])
        } else {
            array_push(buttons, 
            [
                cancelButton,
                3,
                cancelFunction,
                cancelArguments
            ])
        }
    }
}

popup.my_popup_id = global.current_popup_id
global.current_popup_id += 1

return popup

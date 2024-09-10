var popupLabel = argument0
var popupText = argument1 
var closeButton = argument2 
if(closeButton == undefined)
    closeButton = "OKAY"


var popup = instance_create_layer(0, 0, "FadeOutIn", obj_shellworksUI_popup)

with(popup){
    label = popupLabel
    text = popupText

    buttons = [
        [
            closeButton, //Label
            0 //Type (0 = close the popup)
        ]
    ]
}

return popup
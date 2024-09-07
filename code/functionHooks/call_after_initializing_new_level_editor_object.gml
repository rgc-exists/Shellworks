var return_value = #orig#(argument0)

var width = argument0.bbox_right - argument0.bbox_left
while(width < 1){
    argument0.image_xscale += 0.01
    width = argument0.bbox_right - argument0.bbox_left
}
var height = argument0.bbox_bottom - argument0.bbox_top
while(height < 1){
    argument0.image_yscale += 0.01
    height = argument0.bbox_bottom - argument0.bbox_top
}

return return_value
modhelper_comment("ARGS: key, value, [mood]")

var kkey = argument0
var ktrans = argument1
var kmood = argument2 
if(kmood == undefined){
    kmood = ""
}

if(ds_map_find_value(global.loca_ds_map_text_translations, kkey) != -1){
    ds_map_delete(global.loca_ds_map_text_translations, kkey)
    ds_map_delete(global.loca_ds_map_text_moods, kkey)
}

ds_map_add(global.loca_ds_map_text_translations, kkey, ktrans)
ds_map_add(global.loca_ds_map_text_moods, kkey, kmood)

return kkey
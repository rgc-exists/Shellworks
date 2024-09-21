if campaign_is_readonly(info[0])
{
    show_debug_message("Cant save a readonly campaign's level!")
    return true;
}
if ((time == 0))
{
    display_text = "SAVING"
    return false;
}
var campaignInfo = ds_map_find_value(global.campaignMap, array_get(info, 0))
var levelData = campaignInfo.levels[info[1]]
if (levelData.isModded && (!global.isEditorModded))
{
    show_debug_message("Can't save a modded level!")
    return true;
}
fileBuffer = buffer_create(1, buffer_grow, 1)
var has_exploration_point = false
var player_tool_struct = undefined
var uses_modded_elements = false
li = 0
while ((li < ds_list_size(global.li_level_editor_database)))
{
    dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
    if dataBaseStruct.modded
    {
        uses_modded_elements = true
        break
    }
    else
        li++
}
buffer_write(fileBuffer, buffer_text, (global.game_build_version + (uses_modded_elements ? "_MODDED" : "")))
buffer_write(fileBuffer, buffer_text, "\n")
LVLX1 = obj_level_editor.level_bound_x1
LVLY1 = obj_level_editor.level_bound_y1
LVLW = (obj_level_editor.level_bound_x2 - obj_level_editor.level_bound_x1)
LVLH = (obj_level_editor.level_bound_y2 - obj_level_editor.level_bound_y1)
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, "LEVEL DIMENSIONS:")
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, string(LVLW))
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, string(LVLH))
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, "TOOL DATA:")
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, string(ds_list_size(global.li_level_editor_database)))
buffer_write(fileBuffer, buffer_text, "\n")
for (li = 0; li < ds_list_size(global.li_level_editor_database); li++)
{
    dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
    buffer_write(fileBuffer, buffer_text, dataBaseStruct.custom_tool_or_object_id)
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, string(dataBaseStruct.image_angle))
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, string(dataBaseStruct.image_xscale))
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, string(dataBaseStruct.image_yscale))
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, string(array_length(dataBaseStruct.tool_properties)))
    buffer_write(fileBuffer, buffer_text, "\n")
    var toolProps = dataBaseStruct.tool_properties
    for (ti = 0; ti < array_length(toolProps); ti++)
    {
        thsToolProp = toolProps[ti]
        buffer_write(fileBuffer, buffer_text, thsToolProp.key)
        buffer_write(fileBuffer, buffer_text, "\n")
        buffer_write(fileBuffer, buffer_text, string(thsToolProp.value))
        buffer_write(fileBuffer, buffer_text, "\n")
    }
}
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, "QUICK SLOTS:")
buffer_write(fileBuffer, buffer_text, "\n")
for (li = 0; li < 10; li++)
{
    dataBaseStruct = ds_list_find_value(obj_level_editor.li_quicktool_slots, li)
    buffer_write(fileBuffer, buffer_text, dataBaseStruct.custom_tool_or_object_id)
    buffer_write(fileBuffer, buffer_text, "\n")
}
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, "PLACED OBJECTS:")
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, string(ds_list_size(global.li_level_editor_database)))
buffer_write(fileBuffer, buffer_text, "\n")
for (li = 0; li < ds_list_size(global.li_level_editor_database); li++)
{
    dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
    buffer_write(fileBuffer, buffer_text, dataBaseStruct.custom_tool_or_object_id)
    buffer_write(fileBuffer, buffer_text, "\n")
    if ((dataBaseStruct.custom_tool_or_object_id == "exploration_point"))
        has_exploration_point = (ds_list_size(dataBaseStruct.li_placed_instances) > 0)
    else if ((dataBaseStruct.custom_tool_or_object_id == "player"))
        player_tool_struct = dataBaseStruct
    buffer_write(fileBuffer, buffer_text, string(ds_list_size(dataBaseStruct.li_placed_instances)))
    buffer_write(fileBuffer, buffer_text, "\n")
    for (ti = 0; ti < ds_list_size(dataBaseStruct.li_placed_instances); ti++)
    {
        thisInst = ds_list_find_value(dataBaseStruct.li_placed_instances, ti)
        buffer_write(fileBuffer, buffer_text, string((thisInst.x - LVLX1)))
        buffer_write(fileBuffer, buffer_text, "\n")
        buffer_write(fileBuffer, buffer_text, string((thisInst.y - LVLY1)))
        buffer_write(fileBuffer, buffer_text, "\n")
        buffer_write(fileBuffer, buffer_text, string(thisInst.image_angle))
        buffer_write(fileBuffer, buffer_text, "\n")
        buffer_write(fileBuffer, buffer_text, string(thisInst.image_xscale))
        buffer_write(fileBuffer, buffer_text, "\n")
        buffer_write(fileBuffer, buffer_text, string(thisInst.image_yscale))
        buffer_write(fileBuffer, buffer_text, "\n")
        if (!(variable_instance_exists(thisInst, "map_properties")))
        {
            buffer_write(fileBuffer, buffer_text, string(0))
            buffer_write(fileBuffer, buffer_text, "\n")
        }
        else if (!(ds_exists(thisInst.map_properties, 1)))
        {
            buffer_write(fileBuffer, buffer_text, string(0))
            buffer_write(fileBuffer, buffer_text, "\n")
        }
        else
        {
            buffer_write(fileBuffer, buffer_text, string(ds_map_size(thisInst.map_properties)))
            buffer_write(fileBuffer, buffer_text, "\n")
            thisKey = ds_map_find_first(thisInst.map_properties)
            for (pri = 0; pri < ds_map_size(thisInst.map_properties); pri++)
            {
                buffer_write(fileBuffer, buffer_text, thisKey)
                buffer_write(fileBuffer, buffer_text, "\n")
                var the_value = ds_map_find_value(thisInst.map_properties, thisKey)
                if ((typeof(the_value) == "string"))
                    show_error(((((("string where number should be! \nkey:" + thisKey) + "\nstruct:") + dataBaseStruct.custom_tool_or_object_id) + "\nvalue:") + the_value), true)
                buffer_write(fileBuffer, buffer_text, string(the_value))
                buffer_write(fileBuffer, buffer_text, "\n")
                thisKey = ds_map_find_next(thisInst.map_properties, thisKey)
            }
        }
    }
}
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, "WIRES:")
buffer_write(fileBuffer, buffer_text, "\n")
buffer_write(fileBuffer, buffer_text, string(ds_list_size(global.lvl_wires)))
buffer_write(fileBuffer, buffer_text, "\n")
for (li = 0; li < ds_list_size(global.lvl_wires); li++)
{
    thisWire = ds_list_find_value(global.lvl_wires, li)
    fromObj = thisWire.from_obj
    var fromToolStruct = fromObj.toolStruct
    fromObj_indexInList = ds_list_find_index(fromToolStruct.li_placed_instances, fromObj)
    buffer_write(fileBuffer, buffer_text, fromToolStruct.custom_tool_or_object_id)
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, string(fromObj_indexInList))
    buffer_write(fileBuffer, buffer_text, "\n")
    toObj = thisWire.to_obj
    var toToolStruct = toObj.toolStruct
    toObj_indexInList = ds_list_find_index(toToolStruct.li_placed_instances, toObj)
    buffer_write(fileBuffer, buffer_text, toToolStruct.custom_tool_or_object_id)
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, string(toObj_indexInList))
    buffer_write(fileBuffer, buffer_text, "\n")
}
buffer_save(fileBuffer, saveName)
buffer_delete(fileBuffer)
var hasexplo = variable_struct_get(levelData, "hasExplorationPoint")
var levelico = variable_struct_get(levelData, "levelIcon")
var ismodded = variable_struct_get(levelData, "isModded")
var startsunlocked = variable_struct_get(levelData, "startUnlocked")
var lvltyp = variable_struct_get(levelData, "levelType")
var lvldiff = variable_struct_get(levelData, "diffPoints")
var is_different = false
if is_undefined(hasexplo)
    hasexplo = ""
if is_undefined(levelico)
    levelico = ""
if is_undefined(ismodded)
    ismodded = ""
if is_undefined(startsunlocked)
    startsunlocked = ""
if is_undefined(lvltyp)
    lvltyp = ""
if is_undefined(lvldiff)
    lvldiff = ""
levelData.hasExplorationPoint = has_exploration_point

var lvl_icon_prop = ds_map_find_value(player_tool_struct.ds_map_tool_properties, "lvl_icon")
var lvl_unlocked_prop = ds_map_find_value(player_tool_struct.ds_map_tool_properties, "lvl_unlocked")
var lvl_type_prop = ds_map_find_value(player_tool_struct.ds_map_tool_properties, "lvl_type")
var lvl_diff_prop = ds_map_find_value(player_tool_struct.ds_map_tool_properties, "lvl_diff")

levelData.levelIcon = ds_list_find_value(global.communityLevelIconsList, lvl_icon_prop.value)
levelData.isModded = uses_modded_elements
levelData.startUnlocked = (lvl_unlocked_prop.value == 1)
levelData.levelType = lvl_type_prop.value
levelData.diffPoints = lvl_diff_prop.value

is_different = ((hasexplo != has_exploration_point) ? true : ((levelico != levelData.levelIcon) ? true : ((ismodded != uses_modded_elements) ? true : ((startsunlocked != levelData.startUnlocked) ? true : ((lvltyp != levelData.levelType) ? true : (lvldiff != levelData.diffPoints))))))
if is_different
{
    save_leveleditor_campaign(info[0])
    with (obj_level_editor)
    {
        if ((level_select_tab == 0))
            script_execute(self.scr_level_editor_populate_level_list)
    }
}
return true;
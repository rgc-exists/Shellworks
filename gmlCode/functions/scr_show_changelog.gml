

gml_Script_shellworks_imgui_createpopup_message("SHELLWORKS CHANGELOG " + global.shellworks_version,
"CHANGELOG

MAJOR FEATURE - ADVANCED COPY TOOL:
-A variation of the copy tool that allows you to do a whole bunch of extra things:
-Pasting MULTIPLE instances of the copied objects in rows and columns, allowing you to make custom \"tiles\"
-Scaling the copied objects on both axis
-Changing the GRID SIZE that the placements snaps to
-Optional randomized placement mode
-A few other things

The advanced copy tool was added in the past, but reverted due to major bugs.

THINGS THAT CHANGED IN THE UPDATE SINCE THE ORIGINAL REVERTED VERSION:
-Advanced copy tool settings now transfer even after you save/reload the level.
(This makes up for the fact that I can't save custom tool settings in the level without crashing the vanilla game.)
-Fixed a bug where lava objects couldn't be deleted by the trash tool.


NEW MAJOR CHANGES:
-The move tool can select MULTIPLE objects by right clicking.
THE CODE FOR THIS FEATURE WAS ENTIRELY WRITTEN BY NAMETHEMPGUY! Thank you Name, you are the GOAT of WYS modding. :)

NEW MINOR CHANGES:
-Made it so when you place an object with a scale that cant be deleted it gets scaled up until it's safe

BUG FIXES:
-Soundtrack player no longer sometimes crashes due to the NORMAL player's hat being spawned for the BOUNCING snails.

EXTRA NOTES:
While a color scheme editor was in early stages of development, it has been put on hold for now.

==================================================================================
IMPORTANT:
REMEMBER that you may have to extend the size of the windows by dragging on their bottom right corner in order to see new features.
They may otherwise be cut off.
",

"Okay")
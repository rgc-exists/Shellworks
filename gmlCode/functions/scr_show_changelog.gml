

gml_Script_shellworks_imgui_createpopup_message("SHELLWORKS CHANGELOG " + global.shellworks_version,
"
CHANGELOG:
-Remove the experimental/broken color scheme stuff because I accidentally left it in when trying to fix a small bug.


LAST MAJOR VERSION CHANGELOG:
MAJOR FEATURE - ADVANCED COPY TOOL:
-A variation of the copy tool that allows you to do a whole bunch of extra things:
-Pasting MULTIPLE instances of the copied objects in rows and columns, allowing you to make custom \"tiles\"
-Scaling the copied objects on both axis
-Changing the GRID SIZE that the placements snaps to
-Optional randomized placement mode
-A few other things

The advanced copy tool was added in the past, but reverted due to major bugs.

THINGS THAT CHANGED IN THE UPDATE SINCE THE ORIGINAL REVERTED VERSION:
-Fixed a bug where lava objects couldn't be deleted by the trash tool.


NEW MAJOR CHANGES:
-Added spawnpoint switcher. Switch between the orange spawnpoint objects with keybinds,
Inspired by Geometry Dash \"Startpos Switcher\".
-Added \"optimized saving\", which DRASTICALLY speeds up save times for large levels using buffers.
-Added \"preserve copy order\", which preserves the layer order of copied objects instead of randomizing it.
-Updated the mod to work with the Slices Of Infinity update (v2.11)

NEW MINOR CHANGES:
-Made it so when you place an object with a scale that cant be deleted it gets scaled up until it's safe
-Made copyable wires optional

NEW TECHNICAL CHANGES:
-Updated GMSL to dotnet 8 due to updates to UndertaleModTool.
-Added a warning that shows when an unsupported game version is detected.
-Give user option to disable Shellworks until the next update with unsupported game version.
-Renamed the \"is_Shellworks_client\" global var to \"is_shellworks_client\" with a lowercase S.


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
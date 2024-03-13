
#orig#()
gml_Script_scr_initialize_BSE_settings()
if scr_save_settings_exists()
    scr_load_settings()
scr_save_settings()
txt_1 = "SHELLWORKS GS2ML E" + "ND-OF-LIFE" //Due to a UMT bug, using "END" in a string results in the number 2 in its place.
txt_2 = "Shellworks is soon transferring from gs2ml to gmsl as its mod loader of choice.\n\nWHEN THIS HAPPENS, YOU WILL NEED TO DOWNLOAD THE UPDATE MANUALLY."

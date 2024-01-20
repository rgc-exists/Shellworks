if (room == performance_check)
    display_set_timing_method(0)
if (room != performance_check)
{
    if (room != empty_start_room)
        instance_destroy()
}
if (!enabled)
{
}
event_timer++
if (frames_measured >= 2)
{
    if (event_timer >= 2)
    {
        time_measured += delta_time
        time_measured_total += delta_time
    }
}
frames_measured++
if (frames_measured >= 3)
    fps_measured = (((frames_measured - 2) * 1000000) / (time_measured + 1))
else
    fps_measured = 0
if (event == 0)
{
    if (event_timer > 3)
    {
        ini_open("AllSaveSlots.ini")
        dateseconds = date_get_second_of_year(date_current_datetime())
        dateseconds_last = ini_read_real("MAIN", "SwitchSaveSlotTiming", 0)
        ini_write_real("MAIN", "SwitchSaveSlotTiming", 0)
        ini_close()
        if (global.setting_loca_text == "Simplified Chinese" || global.setting_loca_text == "Traditional Chinese")
        {
            if (shownfondgamelogo == 0)
            {
                event_timer = -200
                shownfondgamelogo = 1
                return;
            }
        }
        if (file_exists("SettoIngs23-2.set"))
        {
            if ((dateseconds - dateseconds_last) < 2)
                room_goto(main_menu_dark)
            else if shownfondgamelogo
            {
                persistent = 0
                scr_fade_to_room(164)
            }
            else
            {
                room_goto(disclaimer_photoepilepsy)
                instance_destroy()
            }
        }
        else
        {
            scr_quality_setting_presets(-1)
            scr_save_settings()
            event++
            event_timer = 0
            if shownfondgamelogo
                scr_fade_to_room(1)
            else
                room_goto(performance_check)
        }
    }
}
if (event == 1)
{
    if (event_timer > 120)
    {
        event++
        event_timer = 0
        frames_measured = 0
        time_measured = 0
        scr_quality_setting_presets(0)
        with (detath_particle_spawner)
            event_user(0)
    }
}
if (event >= 2)
{
    if ((time_measured / 1000000) > measure_for_sec)
    {
        if (fps_measured >= target_fps_minimum)
        {
            scr_save_settings()
            event++
            scr_quality_setting_presets((event - 2))
            event_timer = 0
            frames_measured = 0
            time_measured = 0
            if (event < 6)
            {
                with (obj_fx_death)
                    instance_destroy()
                with (detath_particle_spawner)
                    event_user(0)
            }
        }
        else
        {
            scr_load_settings()
            scr_fade_to_room(164)
            persistent = 0
        }
    }
}
if (event >= 6)
{
    scr_fade_to_room(164)
    persistent = 0
}

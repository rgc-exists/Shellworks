if instance_exists(obj_player)
{
    if variable_instance_exists(obj_player.id, "inputjumppress")
    {
        if obj_player.inputjumppress
        {
            global.total_jumps_so_far += 1
            global.attempt_jumps_so_far += 1
        }
    }
}

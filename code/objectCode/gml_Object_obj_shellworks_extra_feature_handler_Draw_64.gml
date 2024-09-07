

draw_set_halign(fa_right)
draw_set_valign(fa_top)
draw_set_color(c_white)
final_string = ""
if (global.total_jumps_so_far_enabled)
    final_string += "TOTAL JUMPS: " + string(global.total_jumps_so_far) + "\n"
if (global.attempt_jumps_so_far_enabled)
    final_string += "ATTEMPT JUMPS: " + string(global.attempt_jumps_so_far) + "\n"
if (global.total_half_jumps_so_far_enabled)
    final_string += "TOTAL HALF JUMPS: " + string(global.total_half_jumps_so_far) + "\n"

draw_text_transformed(1914, 6, final_string, 0.6, 0.6, 0)


with(obj_levelstyler){
    if instance_exists(obj_backdraw)
    {
        obj_backdraw.scale_min = background_size_min
        obj_backdraw.scale_max = background_size_max
        obj_backdraw.background_parallax_min = background_parallax_min
        obj_backdraw.background_parallax_max = background_parallax_max
        obj_backdraw.background_scroll_speed = background_scroll_speed
        obj_backdraw.background_scroll_speed_min = background_scroll_speed_min
        switch background_style
        {
            case 1:
                obj_backdraw.texture = spr_sandstorm
                break
            case 2:
                obj_backdraw.texture = spr_backtest1
                break
            case 3:
                obj_backdraw.texture = spr_backtest2
                break
            case 4:
                obj_backdraw.texture = spr_backtest3
                break
            case 5:
                obj_backdraw.texture = spr_backtest4
                break
            case 6:
                obj_backdraw.texture = spr_backtest5
                break
            case 7:
                obj_backdraw.texture = spr_backtest6
                break
            case 8:
                obj_backdraw.texture = spr_backtest7
                break
            case 9:
                obj_backdraw.texture = spr_backtest8
                break
            case 10:
                obj_backdraw.texture = spr_backtest9
                break
            case 11:
                obj_backdraw.texture = spr_backtest10
                break
            case 12:
                obj_backdraw.texture = spr_backtest11
                break
            case 13:
                obj_backdraw.texture = spr_backtest12
                break
            case 14:
                obj_backdraw.texture = spr_backtest2_B
                break
            case 15:
                obj_backdraw.texture = spr_backtest2_C
                break
            case 16:
                obj_backdraw.texture = SmoothBack
                break
            case 17:
                obj_backdraw.texture = spr_back_underw1
                break
            case 18:
                obj_backdraw.texture = spr_back_underw2
                break
            case 19:
                obj_backdraw.texture = spr_back_underw3
                break
        }

    }

}
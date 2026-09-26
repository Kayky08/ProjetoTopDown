// Inherit the parent event
event_inherited();

#region variables
time_destruction = game_get_speed(gamespeed_fps) * 0.3;
timer_destruction = 0;
#endregion

#region functions
self_destruction = function (){
    timer_destruction++
    
    if(timer_destruction >= time_destruction){
        timer_destruction = 0;
        
        instance_destroy();
    }
}
#endregion
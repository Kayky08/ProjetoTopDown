#region variables
state = "normal"

//melting
time_melting = game_get_speed(gamespeed_fps) * 4
timer_melting = 0

#endregion

#region functions
state_machine = function (){
    switch (state) {
        case "normal":
            
            timer_melting++;
            
            if(timer_melting >= time_melting * 0.25){
                
                state = "melting_middle"
            }
        break;
        
    	case "melting_start":
            sprite_index = spr_ice_melting_start
            
            timer_melting++;
            
            if(timer_melting >= time_melting * 0.5){
                
                state = "melting_middle"
            }
        break;
        
        case "melting_middle":
            sprite_index = spr_ice_melting_middle
            
            timer_melting++
            
            if(timer_melting >= time_melting * 0.75){
                
                state = "melting_end"
            }
        break;
        
        case "melting_end":
            sprite_index = spr_ice_melting_end
            
            timer_melting++
            
            if(timer_melting >= time_melting){
                timer_melting = 0;
                
                instance_destroy();
            }
        break;
    }
}
#endregion
#region variables
state = "spawn"

life = 10

time_spawn = game_get_speed(gamespeed_fps) * 3;
timer_spawn = 0
#endregion

#region functions
state_machine = function (){
    switch (state) {
    	case "spawn":
            instance_create_layer(x,y,layer,obj_enemie);
            
            state = "recharging_spawn";
        break;
    
        case "recharging_spawn":
            timer_spawn++
            
            if(timer_spawn >= time_spawn){
                timer_spawn = 0;
                
                state = "spawn";
            }
        break;
    }
}
#endregion
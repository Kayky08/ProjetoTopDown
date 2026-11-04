#region variables
// Atributos
life = 10

state = "spawn"

// Timers
timer = 0

time_spawn = game_get_speed(gamespeed_fps) * 5

#endregion

#region functions
// Maquina de estados do inimigo
state_machine = function (){
    switch (state) {
    	case "spawn":
            instance_create_layer(x,y,layer,obj_enemie)
            
            state = "recharging_spawn"
        break
        
        case "recharging_spawn":
            timer++
            
            image_speed += 0.005
            
            if(timer >= time_spawn){
                image_speed = 1
                timer = 0
                
                state = "spawn"
            }
        break
    }
}
#endregion
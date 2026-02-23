#region variables
//State
state = "normal";

//Shoots
time_recharge = game_get_speed(gamespeed_fps);
timer_recharge = 0;
stress = 0;
time_stress = game_get_speed(gamespeed_fps) * 3;
timer_stress = 0;
shoot = obj_shoot;
icon = spr_icon;

//Controls
fire = 0;
#endregion

#region functions
get_inputs = function (){
    fire = mouse_check_button(mb_left);
}

shooting = function (shoot_type){
    if (shoot_type == obj_shoot_fire) {
        var _dir = random_range(-45,45);
         
        var shoot = instance_create_layer(x,y,layer,shoot_type);
        
        shoot.speed = spd;
        shoot.direction = point_direction(x,y,mouse_x,mouse_y) + _dir;
        shoot.image_angle = point_direction(x,y,mouse_x,mouse_y);
    }
    else {
    	var shoot = instance_create_layer(x,y,layer,shoot_type);
        
        shoot.speed = spd;
        shoot.direction = point_direction(x,y,mouse_x,mouse_y);
        shoot.image_angle = point_direction(x,y,mouse_x,mouse_y) + 90;
    }
}

state_machine = function (){
    get_inputs();
    
    switch (state) {
    	case "normal":
            if(!fire && shoot == obj_shoot_fire){
                stress = clamp(stress,2,100);
                stress -= 0.1;
            }
            
            if(fire){
                state = "shooting";
            }
        break;
        
        case "shooting":
            shooting(shoot);
            
            if (shoot == obj_shoot) state = "recharging_normal";
            if (shoot == obj_shoot_ice) state = "recharging_ice";
            if (shoot == obj_shoot_fire) state = "recharging_fire";
        break;
    
        case "recharging_normal":
            timer_recharge++;
            
            if(timer_recharge >= time_recharge){
                timer_recharge = 0;
                
                state = "normal";
            }
        break;
        
        case "recharging_ice":
            timer_recharge++;
            
            if(timer_recharge >= time_recharge){
                timer_recharge = 0;
                
                state = "normal";
            }
        break;
        
        case "recharging_fire":
            timer_recharge++;
            stress++
            
            if(timer_recharge >= time_recharge){
                timer_recharge = 0;
                
                if(stress < 100){
                    state = "normal";
                }
                else {
                	state = "stressed";
                }
            }
        break;
        
        case "stressed": 
            timer_stress++;
            stress -= 0.5;
            
            if(timer_stress >= time_stress && stress <= 0){
                timer_stress= 0;
                
                state = "normal";
            }
        break;
    }
}
#endregion
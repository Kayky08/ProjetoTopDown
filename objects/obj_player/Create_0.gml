#region variables
//Create hands
rhand = instance_create_layer(x+35,y,layer,obj_hand_right)
lhand = instance_create_layer(x-35,y,layer,obj_hand_left)
position_hands = true

//Life
life = 10;
time_invencible = game_get_speed(gamespeed_fps);
timer_invencible = 0

//Movementation
max_spd = 3;
hspd = 0;
vspd = 0;

//State
state = "normal";

//Collision
collissions = [obj_collision_wall,obj_ice];

//Shoots
time_recharge = game_get_speed(gamespeed_fps);
timer_recharge = 0;
stress = 0;
time_stress = game_get_speed(gamespeed_fps) * 3;
timer_stress = 0;
shoot = obj_shoot;
shoot2 = obj_shoot
icon = spr_icon;

//controls
up = 0;
down = 0;
left = 0;
right = 0
fire = 0;
inverted = 0; 
#endregion

#region functions
move_hands = function (){
    if (inverted) position_hands = !position_hands;
    
    if (position_hands) {
    	lhand.x = x + 35
        rhand.x = x - 35
        
        lhand.y = y
        rhand.y = y
    }
    else {
    	lhand.x = x 
        rhand.x = x 
        
        lhand.y = y - 35
        rhand.y = y + 35
    }
}

verify_life = function (){
    if(life == 0) damage();
}
damage = function (){
    if(life > 0 && timer_invencible == 0){
        life--;
        
        state = "invencible";
    }
    
    if (life == 0) {
    	room_restart();
    }
}

get_inputs = function (){
    up = keyboard_check(ord("W"));
    down = keyboard_check(ord("S"));
    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
    fire = mouse_check_button(mb_left);
    inverted = mouse_check_button_pressed(mb_right);
}
movementation = function (){
   move_and_collide(hspd,0,collissions,12);
   move_and_collide(0,vspd,collissions,12);
}
aply_speed = function (){
    hspd = (right - left) * max_spd
    vspd = (down - up) * max_spd
}
shooting = function (shoot_type1,shoot_type2){
    var shoot1 = instance_create_layer(lhand.x,lhand.y,layer,shoot_type1);
    var shoot2 = instance_create_layer(rhand.x,rhand.y,layer,shoot_type1);
    
    shoot1.speed = 5;
    shoot1.direction = point_direction(x,y,mouse_x,mouse_y);
    shoot1.image_angle = point_direction(x,y,mouse_x,mouse_y) + 90;
    
    shoot2.speed = -5;
    shoot2.direction = point_direction(x,y,mouse_x,mouse_y);
    shoot2.image_angle = point_direction(x,y,mouse_x,mouse_y) + 90;
}

state_machine = function (){
    move_hands();
    get_inputs(); 
    
    switch (state){
    	case "normal":
            hspd = 0;
            vspd = 0;
            
            if(!fire && shoot == obj_shoot_fire){
                stress = clamp(stress,2,100);
                stress -= 0.1;
            }
            
            aply_speed();
            
            if(fire){
                state = "shooting";
            }
        break;
        
        case "shooting":
            shooting(shoot,shoot2);
            
            if (shoot == obj_shoot) state = "recharging_normal";
            if (shoot == obj_shoot_ice) state = "recharging_ice";
            if (shoot == obj_shoot_fire) state = "recharging_fire";
        break;
    
        case "recharging_normal":
            aply_speed();
            
            timer_recharge++;
            
            if(timer_recharge >= time_recharge){
                timer_recharge = 0;
                
                state = "normal";
            }
        break;
        
        case "recharging_ice":
            aply_speed();
            
            timer_recharge++;
            
            if(timer_recharge >= time_recharge){
                timer_recharge = 0;
                
                state = "normal";
            }
        break;
        
        case "recharging_fire":
            aply_speed();
            
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
            aply_speed();
            
            timer_stress++;
            stress -= 0.5;
            
            if(timer_stress >= time_stress && stress <= 0){
                timer_stress= 0;
                
                state = "normal";
            }
        break;
    
        case "invencible":
            aply_speed()
            
            timer_invencible++;
            
            if(timer_invencible >= time_invencible){
                timer_invencible = 0;
                
                state = "normal";
            }
        break;
    }
}
#endregion
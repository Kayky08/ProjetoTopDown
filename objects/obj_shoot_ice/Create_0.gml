// Inherit the parent event
event_inherited();

#region variables
//Freeze
time_freeze = game_get_speed(gamespeed_fps)
timer_freeze = 0

//Collision
collision_player = false

//Check position 
position_x = 0;
position_y = 0;

#endregion

#region functions
check_angle = function (){
    if(direction >= 0 && direction <= 90){
        position_x = 64;
        position_y = -64;
    }
    else if (direction >= 91 && direction <= 180) {
    	position_x = -64;
        position_y = -64;
    }
    else if (direction >= 181 && direction <= 270) {
    	position_x = -64;
        position_y = 64;
    }
    else if (direction >= 271 && direction <= 360) {
    	position_x = 64;
        position_y = 64;
    }
}

check_player = function (){
    var _collision = instance_create_layer(x,y,layer,obj_collision_shoot_ice);
    
    with (_collision) {
        if(place_meeting(x,y,obj_player)){
            other.collision_player = true;
        }
        
        instance_destroy();
    }
    
    if(collision_player){
        check_angle();
        
        instance_create_layer(x + position_x,y + position_y,layer,obj_ice);
    }
    else { 
        instance_create_layer(x,y,layer,obj_ice);
    }
    
    instance_destroy();
}

freeze = function (){
    timer_freeze++
    
    if(timer_freeze >= time_freeze || mouse_check_button_pressed(mb_right)){
        check_player();
    }
}

#endregion
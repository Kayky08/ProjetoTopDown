#region variables
state = "normal";

life = 3;

max_spd = 2;
hpsd = 0;
vpsd = 0;

collisions = [obj_ice,obj_collision_wall];

#endregion

#region functions
damage = function (){
    if(life > 0){
        life--
        
        state = "normal";
    }
    
    if(life == 0){
        instance_destroy();
    }
}

verify_life = function (){
    if(life == 0) damage();
}

persecution = function (){
    direction = point_direction(x,y,obj_player.x,obj_player.y);
    speed = 1;
}

state_machine = function (){
    switch (state) {
    	case "normal":
            persecution()
        break;
    }
}
#endregion
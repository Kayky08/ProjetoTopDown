#region variables
cell_size = 16

state = "normal";

life = 50;

max_spd = 2;
hpsd = 0;
vpsd = 0;

collisions = [obj_ice,obj_collision_wall];

target = obj_player
areas = [obj_dk_explosion_area,obj_dk_push_area]

path = path_add()

#endregion

#region functions
damage = function (_damage = 1){
    if(life > 0){
        life -=_damage
        
        state = "normal";
    }
    
    if(life <= 0){
        instance_destroy();
    }
}

verify_life = function (){
    if(life == 0) damage();
}

persecution = function (target = obj_player){
    if instance_exists(target){
        var _x = x;
        var _y = y;
        
        var _xx = (target.x div cell_size) * cell_size + cell_size/2;
        var _yy = (target.y div cell_size) * cell_size + cell_size/2;
        
        if(mp_grid_path(obj_map.mp_grid,path,_x,_y,_xx,_yy,true)){
            path_start(path,max_spd,path_action_continue,false);
        }
    }
}

state_machine = function (){
    switch (state) {
    	case "normal":
            persecution(target)
        break;
    }
}
#endregion
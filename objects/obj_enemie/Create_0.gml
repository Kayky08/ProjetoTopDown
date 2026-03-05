#region variables
cell_size = 16

state = "normal";

life = 3;

max_spd = 2;
hpsd = 0;
vpsd = 0;

collisions = [obj_ice,obj_collision_wall];

path = path_add()

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
    var _x = x;
    var _y = y;
    
    var _xx = (obj_player.x div cell_size) * cell_size + cell_size/2;
    var _yy = (obj_player.y div cell_size) * cell_size + cell_size/2;
    
    if(mp_grid_path(obj_map.mp_grid,path,_x,_y,_xx,_yy,true)){
        path_start(path,max_spd,path_action_continue,false);
    }
}

state_machine = function (){
    switch (state) {
    	case "normal":
            persecution()
        break;
    }
}
#endregion
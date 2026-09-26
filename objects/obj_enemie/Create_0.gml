#region variables
cell_size = 16

state = "light"

life = 50

max_spd = 1
hpsd    = 0
vpsd    = 0

collisions = [obj_ice,obj_collision_wall]

target = obj_player
areas  = [obj_dk_explosion_area,obj_dk_push_area]

path = path_add()

freeze_time = game_get_speed(gamespeed_fps) * 2
light_time  = game_get_speed(gamespeed_fps) * 0.30
timer = 0

#endregion

#region functions
damage = function (_damage = 1){
    if life > 0 {
        life -=_damage
        
        state = "normal"
    }
    
    if life <= 0 {
        instance_destroy()
    }
}

verify_life = function (){
    if(life == 0) damage()
}

persecution = function (){
    if !instance_exists(target) {
        target = obj_player
        max_spd = 1
    }
    
    var _x = x
    var _y = y
    
    var _xx = (target.x div cell_size) * cell_size + cell_size/2
    var _yy = (target.y div cell_size) * cell_size + cell_size/2
    
    if mp_grid_path(obj_map.mp_grid,path,_x,_y,_xx,_yy,true) {
        path_start(path,max_spd,path_action_continue,false)
    }
}

state_machine = function (){
    switch (state) {
    	case "normal":
            persecution()
        break;
        
        case "freeze":
            path_end()
            
            timer++
            
            if timer > freeze_time {
                timer = 0
                max_spd = 1
                state = "normal"
            }
        break
    
        case "light":
            path_end()
            timer++
            
            if timer >= light_time{
                state = "normal"
            }
        break
    }
}
#endregion
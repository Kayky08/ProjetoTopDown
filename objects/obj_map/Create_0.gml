//Create the cells in the room
cell_size = 16;
cell_h = room_width div cell_size
cell_v = room_height div cell_size
ice_count = 0;


//Create the cells with grid map
mp_grid = mp_grid_create(0,0,cell_h,cell_v,cell_size,cell_size);

//Collisions
mp_grid_add_instances(mp_grid,obj_collision_wall,false);

check_ice = function (){
    var _current_cont = instance_number(obj_ice);
    
    if(_current_cont != ice_count){
        ice_count = _current_cont
        
        mp_grid_clear_all(mp_grid);
        mp_grid_add_instances(mp_grid, obj_collision_wall, false)
        
        if(instance_exists(obj_ice)){
            mp_grid_add_instances(mp_grid,obj_ice,false);
        }
    }
    
   
}
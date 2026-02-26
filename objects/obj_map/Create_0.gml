//Create the cells in the room
cell_size = 16;
cell_h = room_width div cell_size
cell_v = room_height div cell_size

//Create the cells with grid map
mp_grid = mp_grid_create(0,0,cell_h,cell_v,cell_size,cell_size);

//Collisions
mp_grid_add_instances(mp_grid,obj_collision_wall,false)

check_ice = function (){
    
}
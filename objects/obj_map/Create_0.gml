#region Variables
// Definindo os valores das celulas na Room
cell_h = room_width div global.cell_size
cell_v = room_height div global.cell_size

// Criando as celulas com mapa da grid
mp_grid = mp_grid_create(0,0,cell_h,cell_v,global.cell_size,global.cell_size);

#endregion

// Colisões
mp_grid_add_instances(mp_grid,obj_collision_wall,false);
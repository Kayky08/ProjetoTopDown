#region variables
// Pegando o Grid
map = obj_map.mp_grid

// Timer para verificar o tempo
time_spawn_base = game_get_speed(gamespeed_fps) * 5
time_spawn_min  = game_get_speed(gamespeed_fps) * 2
time_spawn      = time_spawn_base
spawn_chance    = 1

timer = 0

#endregion

#region functions
get_spawn_position = function (){
    var _found = false
    
    var _spawn_x = 0
    var _spawn_y = 0
    
    // Tentando buscar uma posição valida
    repeat (30) {
    	// Sortear uma célula da grade
        var _cell_x = irandom(obj_map.cell_h - 1)
        var _cell_y = irandom(obj_map.cell_v - 1) 
        
        // Verificar se está livre
        if mp_grid_get_cell(map,_cell_x,_cell_y) == 0 {
            // Convertendo para pixels
            _spawn_x = _cell_x * global.cell_size + global.cell_size / 2
            _spawn_y = _cell_y * global.cell_size + global.cell_size / 2
            
            // Verificando a distancia do jogador
            if point_distance(_spawn_x,_spawn_y,obj_player.x,obj_player.y) > 200{
                _found = true
                
                break
            }
        }
    }
    
    if _found {
        return [_spawn_x, _spawn_y]
    }
    
    return undefined
}

spawn_enemies = function (){
    timer++
    
    // Pegando o tempo total da partida em segundos
    var _elapsed = obj_stopwatch.hours * 3600 + obj_stopwatch.minutes * 60 + obj_stopwatch.seconds
    
    // Dininuir o intervalo a cada certo tempo
    var _difficulty = floor(_elapsed / 60)
    
    time_spawn = max(time_spawn_min,time_spawn_base - _difficulty * game_get_speed(gamespeed_fps))

    // Verificar se chegou a hora de spawnar o inimigo
    if timer >= time_spawn {
        timer = 0
        
        // Verificar chance de spawn
        repeat (10) {
            if random(1) < spawn_chance {
                var _position = get_spawn_position()
                
                if !is_undefined(_position){
                    instance_create_layer(_position[0],_position[1],layer,obj_enemie)
                }
            }
        }
    }
}

#endregion

timer = time_spawn
#region variables
// Atributos
life = 50

max_spd = 1
hpsd    = 0
vpsd    = 0

// Estado padrão
state = "normal"

// Tamanho da celula para a locomoção do inimigo
cell_size = 16
path      = path_add()
target    = obj_player

// Arrays
collisions = [obj_ice,obj_collision_wall] // Colisões
areas      = [obj_dk_explosion_area,obj_dk_push_area] // Areas de ativos

// Timers
timer = 0

freeze_time = game_get_speed(gamespeed_fps) * 2
light_time  = game_get_speed(gamespeed_fps) * 0.30

#endregion

#region functions
damage = function (_damage = 1){
    // Verificando se o inimigo ainda possui vida
    if life > 0 {
        life -=_damage
        
        state = "normal"
    }
    
    // Verificando se o inimigo já morreu
    if life <= 0 {
        instance_destroy()
    }
}


// Verificar!!!
verify_life = function (){
    if(life == 0) damage()
}


persecution = function (){
    // Se o target não existe ele define o player como o padrão e redefine a velocidade para o padrão
    if !instance_exists(target) {
        target = obj_player
        max_spd = 1
    }
    
    // Pegando o valor atual do x e y
    var _x = x
    var _y = y
    
    // Definindo o valor para a perseguição do target
    var _xx = (target.x div cell_size) * cell_size + cell_size/2
    var _yy = (target.y div cell_size) * cell_size + cell_size/2
    
    // Verificando se foi encontrado o path e realizando o calculo
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
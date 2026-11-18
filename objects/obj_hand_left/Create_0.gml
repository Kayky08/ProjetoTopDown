 #region variables
// Atributos
state  = "normal"
stress = 0

// Visuais
icon = spr_icon

// Magias
normal_recharging = [obj_magic,obj_magic_darkness,obj_magic_light,obj_magic_wind]
medium_recharging = [obj_magic_ice]
low_recharging    = [obj_magic_fire]

// Timers
timer_recharge = 0
time_recharge_low = game_get_speed(gamespeed_fps) * 0.1
time_recharge_medium = game_get_speed(gamespeed_fps) * 0.5

// Controles
fire = 0

#endregion

#region functions
// Pegando os inputs
get_inputs = function (){
    fire = mouse_check_button(mb_left)
}

// Função para atirar
shooting = function (shoot_type){
    // Verificando se o tipo de magia é de fogo
    if (shoot_type == obj_magic_fire) {
        // Adicioando uma direção variavel
        var _dir = random_range(-45,45)
        
        // Criando a instancia da magia
        var shoot = instance_create_layer(x,y,layer,shoot_type)
        
        // Adicionando os atributos da magia
        shoot.speed       = spd;
        shoot.direction   = point_direction(x,y,mouse_x,mouse_y) + _dir
        shoot.image_angle = point_direction(x,y,mouse_x,mouse_y)
    }
    else {
        // Criando a instancia da magia
    	var shoot = instance_create_layer(x,y,layer,shoot_type)
        
        // Adicionando os atributos da magia
        shoot.speed       = spd
        shoot.direction   = point_direction(x,y,mouse_x,mouse_y)
        shoot.image_angle = point_direction(x,y,mouse_x,mouse_y) + 90
    }
}

// Maquina de estado do player
state_machine = function (){
    // Pegando os controles
    get_inputs();
    
    // Verificando qual estado esta o player
    switch (state) {
    	case "normal":
            state = "shooting"
            
            if global.pause state = "paused"
        break
        
        case "shooting":
            // Chamando a função de atirar
            shooting(shoot)
            
            // Verificando qual tempo de recarca para aplicar
            if array_contains(normal_recharging, shoot) state = "recharging_normal"
            if array_contains(medium_recharging, shoot) state = "recharging_medium"
            if array_contains(low_recharging, shoot)    state = "recharging_low"
            
            if (shoot == obj_magic_fire) state = "recharging_low"
        break
    
        case "recharging_normal":
            // Ativando o timer
            timer_recharge++
            
            // Voltando ao estado normal ao terminar o timer
            if(timer_recharge >= time_recharge_normal){
                timer_recharge = 0
                
                state = "normal"
            }
        break
        
        case "recharging_medium":
            // Ativando o timer e o stresse
            timer_recharge++
            
            // Voltando ao estado normal ao terminar o timer
            if(timer_recharge >= time_recharge_medium){
                timer_recharge = 0
                
                state = "normal"
            }
        break;
        
        case "recharging_low":
            // Ativando o timer e o stresse
            timer_recharge++
            
            // Voltando ao estado normal ao terminar o timer
            if(timer_recharge >= time_recharge_low){
                timer_recharge = 0
                
                state = "normal"
            }
        break;
        
        case "paused":
            if !global.pause state = "normal"
        break
    }
}
#endregion
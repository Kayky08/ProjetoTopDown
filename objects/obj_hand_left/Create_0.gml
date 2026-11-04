 #region variables
// Atributos
state  = "normal"
stress = 0

// Visuais
icon = spr_icon

// Magias
normal_recharging = [obj_magic,obj_magic_darkness,obj_magic_ice,obj_magic_light,obj_magic_wind]

// Timers
time_recharge  = game_get_speed(gamespeed_fps)
timer_recharge = 0

time_stress  = game_get_speed(gamespeed_fps) * 3
timer_stress = 0

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
            // Verifica se é a magia de fogo
            if(shoot == obj_magic_fire){
                // Aumentando o stresse do tiro de fogo
                stress = clamp(stress,2,100)
                stress -= 0.1
            }
            
            state = "shooting"
        break
        
        case "shooting":
            // Chamando a função de atirar
            shooting(shoot)
            
            // Verificando qual tempo de recarca para aplicar
            if array_contains(normal_recharging, shoot) state = "recharging_normal"
            
            if (shoot == obj_magic_fire) state = "recharging_fire"
        break
    
        case "recharging_normal":
            // Ativando o timer
            timer_recharge++
            
            // Voltando ao estado normal ao terminar o timer
            if(timer_recharge >= time_recharge){
                timer_recharge = 0
                
                state = "normal"
            }
        break
        
        case "recharging_fire":
            // Ativando o timer e o stresse
            timer_recharge++
            stress++
            
            // Voltando ao estado normal ao terminar o timer
            if(timer_recharge >= time_recharge){
                timer_recharge = 0
                
                // Verificando se o stresse esta no limite
                if(stress < 100){
                    state = "normal"
                }
                else {
                	state = "stressed"
                }
            }
        break;
        
        case "stressed": 
            // Ativando o timer do stresse e diminuindo
            timer_stress++
            stress -= 0.5
            
            // Voltando ao estado normal ao terminar o timer
            if(timer_stress >= time_stress && stress <= 0){
                timer_stress= 0
                
                state = "normal"
            }
        break
    }
}
#endregion
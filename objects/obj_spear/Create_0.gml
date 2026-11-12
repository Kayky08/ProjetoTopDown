#region Variables
// Atibutos
dir = choose(0,45,90,135,180,225,270,315,360)

// Aumentando a escala do sprite
image_xscale = 1.5;
image_yscale = 1.5;

// Timers
time_animation = game_get_speed(gamespeed_fps) * 0.5
timer_animation = 0

time = game_get_speed(gamespeed_fps) * 2
timer = 0

// Lista de quem ja levou dano
hit_list = []

#endregion

#region functions
self_destruction = function (){
    // Ativando o timer
    timer++
    
    // Fazendo ele se destruir ao final do tempo
    if timer > time{
        instance_destroy();
    }
}

create = function (){
    // Defiinindo a direção que serão lançadas
    var _x = obj_player.x + lengthdir_x(obj_player.sprite_width + 15, dir)
    var _y = obj_player.y + lengthdir_y(obj_player.sprite_height + 15, dir)
    
    // Definindo os atributos
    direction = dir
    image_angle = dir
    
    if timer_animation >= time_animation { 
        x = x
        y = y
    }
    else {
    	x = _x
        y = _y
    }
}

#endregion
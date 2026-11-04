// Inherit the parent event
event_inherited();

#region variables
// Timers
time = game_get_speed(gamespeed_fps) * 0.5
timer = 0

// Lista de quem ja levou dano
hit_list = []

// Força de empurrar
push_force = 10000

#endregion

#region funciotions
self_destruction = function (){
    // Ativando o timer
    timer++
    
    // Fazendo ele se destruir ao final do tempo
    if timer > time{
        instance_destroy();
    }
}

#endregion
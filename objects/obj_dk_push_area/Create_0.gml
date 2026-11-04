#region variables
// Timers
timer = 0
time = game_get_speed(gamespeed_fps) * 0.5

#endregion

#region functions
// Função de explosão
exposion = function (){
    // Iniciando o timer
    timer++
    
    // Se explodindo depois de um tempo
    if timer >= time{
        instance_destroy()
        
        instance_create_layer(x,y,layer,obj_dk_explosion_area)
    }
}

#endregion

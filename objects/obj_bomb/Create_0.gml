
#region variables
// Aumentando a escala da sprite
image_xscale = 2
image_yscale = 2

// Timers
time = game_get_speed(gamespeed_fps) * 3;
timer = 0

#endregion

#region Functions
explosion = function (){
    if !global.pause{
        image_speed = 1
        
        // Ativando o timer
        timer++
        
        // Aumentando a velocidade da animação
        image_speed += 0.04
        
        // Se destruindo e criando a animação de explosão
        if (timer >= time){
            instance_destroy()
            instance_create_layer(x,y,layer,obj_bomb_explosion)
        }
    }
    else {
        image_speed = 0
    }
}

#endregion
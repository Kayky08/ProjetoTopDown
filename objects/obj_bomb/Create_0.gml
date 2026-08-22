image_xscale = 2
image_yscale = 2

time = game_get_speed(gamespeed_fps) * 3;
timer = 0

explosion = function (){
    timer++
    
    image_speed += 0.04
    
    if (timer >= time){
        instance_destroy()
        instance_create_layer(x,y,layer,obj_bomb_explosion)
    }
}
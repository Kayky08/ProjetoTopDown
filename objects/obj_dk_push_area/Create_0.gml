timer = 0
time = game_get_speed(gamespeed_fps) * 3

exposion = function (){
    timer++
    
    if timer >= time{
        instance_destroy()
        
        instance_create_layer(x,y,layer,obj_dk_explosion_area)
    }
}
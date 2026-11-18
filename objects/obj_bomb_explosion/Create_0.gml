#region variaveis
image_xscale = 3
image_yscale = 3

hit_list = [];

#endregion

#region funções
check_pause = function (){
    if global.pause {
        image_speed = 0
    }
    else {
    	image_speed = 1
    }
}
#endregion
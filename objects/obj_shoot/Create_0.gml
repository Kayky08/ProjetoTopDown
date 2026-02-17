#region variablessa
spd = 5;

#endregion

#region functions
destroy = function (){
    if(x >= room_width || x <= 0 || y >= room_height || y <= 0){
        instance_destroy();
    }
}

#endregion
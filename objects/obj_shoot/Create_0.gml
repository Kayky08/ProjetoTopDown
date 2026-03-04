#region variablessa
spd = 5;

bounce = true
fear = false


#endregion

#region functions
aply_bounce = function(){
    x = -x
    y = -y
}

destroy = function (){
    if(x >= room_width || x <= 0 || y >= room_height || y <= 0){
        instance_destroy();
    }
}

#endregion
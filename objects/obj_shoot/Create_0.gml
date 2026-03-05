#region variablessa
bounce = true;
fear = false;
tracking = false;
multiple = false;

#endregion

#region functions
damage = function (){
    if(life > 0){
        life--;
    }
    
    if (life == 0) {
    	instance_destroy();
    }
}

aply_bounce = function(){
    speed = spd * -1;
}

destroy = function (){
    if(x >= room_width || x <= 0 || y >= room_height || y <= 0){
        instance_destroy();
    }
}

#endregion
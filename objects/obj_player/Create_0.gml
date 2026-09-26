#region variables
//Create hands
rhand = instance_create_layer(x + 35,y,layer,obj_hand_right)
lhand = instance_create_layer(x - 35,y,layer,obj_hand_left)
position_hands = true

//Life
time_invencible = game_get_speed(gamespeed_fps);
timer_invencible = 0

//Movementation
hspd = 0;
vspd = 0;

//Collision
collissions = [obj_collision_wall,obj_ice];

//Shoots
time_recharge = game_get_speed(gamespeed_fps);
timer_recharge = 0;
stress = 0;
time_stress = game_get_speed(gamespeed_fps) * 3;
timer_stress = 0;
icon = spr_icon;

//Secundary Weapons
weapon_sec = noone;
weapon_ter = noone;
weapon_fou = noone;
weapon_fif = noone;

icon_sec = spr_icon_slash
icon_ter = noone
icon_fou = noone
icon_fif = noone

bombs_counts = 3;

time_wsec = game_get_speed(gamespeed_fps) * 3;
timer_wsec = 0

//controls
up = 0;
down = 0;
left = 0;
right = 0
fire = 0;
inverted = 0;

#endregion

#region functions
move_hands = function (){
    // FPegando a direção do mouse
    var _dir = point_direction(x,y,mouse_x,mouse_y);
    
    // Pegando a razão entre o tamanho do sprite e a direção de cada mão
    var _x = x + lengthdir_x(sprite_width + 10,_dir)
    var _y = y + lengthdir_y(sprite_height + 10,_dir)
    
    var _xx = x - lengthdir_x(sprite_width + 10,_dir)
    var _yy = y - lengthdir_y(sprite_height + 10,_dir)
    
    // Dando esse valor para a mão
    lhand.x = _x
    lhand.y = _y
    
    rhand.x = _xx
    rhand.y = _yy
}

verify_life = function (){
    // Verificando se o player morreu
    if(life == 0) damage();
}

damage = function (){
    // Verificando se o player pode levar dano
    if(life > 0 && timer_invencible == 0){
        life--;
        
        // Assim que leva o dano fica invencivel
        state = "invencible";
    }
    
    // Se morrer restarta a sala
    if (life == 0) {
    	room_restart();
    }
}

get_inputs = function (){
    // Pegando todos os botões do jogo
    up = keyboard_check(ord("W"));
    down = keyboard_check(ord("S"));
    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
    fire = mouse_check_button(mb_left);
    inverted = mouse_check_button_pressed(mb_right);
}

movementation = function (){
   // Pegando a velocidade horizontal e vertical e aplicando colisões
   move_and_collide(hspd,0,collissions,12);
   move_and_collide(0,vspd,collissions,12);
}

aply_speed = function (){
    // Adicionando velocidade a movimentação do player
    hspd = (right - left) * max_spd
    vspd = (down - up) * max_spd
}

state_machine = function (){
    // Chamando as funções de movimentar as mãos
    move_hands();
    // Chamando as funções de pegar os botões
    get_inputs(); 
    
    // Verificando cada status principal do player
    switch (state){
        
    	case "normal":
            hspd = 0;
            vspd = 0;
            
            aply_speed();
        break;
        
        case "invencible":
            aply_speed()
            
            timer_invencible++;
            
            if(timer_invencible >= time_invencible){
                timer_invencible = 0;
                
                state = "normal";
            }
        break;
    }
    
    // Verificando qual arma secundaria
    switch (weapon_sec) {
        case "pulses":
            create_pulse();
        break;
        
        case "bombs":
            create_bombs()
            
            weapon_sec = "recharge_bombs"
        break;
        
        case "spears":
            create_spear()
            
            weapon_sec = "recharge_spears"
        break;
        
        case "slashs":
            create_slash()
            
            weapon_sec = "recharge_slashs"
        break;
        
        case "recharge_bombs":
            timer_wsec++
            
            if(timer_wsec >= time_wsec){
                timer_wsec = 0;
                
                weapon_sec = "bombs"
            }
        break;
        
        case "recharge_slashs":
            timer_wsec++
            
            if(timer_wsec >= time_wsec){
                timer_wsec = 0;
                
                weapon_sec = "slashs"
            }
        break;
    
        case "recharge_spears":
            timer_wsec++
            
            if(timer_wsec >= time_wsec){
                timer_wsec = 0;
                
                weapon_sec = "spears"
            }
        break;
    }
    
}
#endregion

#region weapons

create_pulse = function (){
    if !instance_exists(obj_pulse){
        instance_create_layer(x,y+15,layer,obj_pulse)
    }
}

create_bombs = function (){
    var _count = 0
    
    repeat (bombs_counts) { 
        var _x = random_range(50, -50)
        var _y = random_range(50, -50)
        
        bomb = instance_create_layer(x + _x, y + _y, layer, obj_bomb)
        _count++
    }
    
    if (_count >= bombs_counts) {
    	weapon_sec = "normal"
    }
}

create_spear = function (){
    var _dir = choose(45,135,225,315)
    
    var _x = x + lengthdir_x(sprite_width + 15, _dir)
    var _y = y + lengthdir_y(sprite_height + 15, _dir)
    
    var _spear = instance_create_layer(_x,_y,layer,obj_spear)
    
    _spear.direction = _dir
    _spear.image_angle = _dir
}

create_slash = function (){
    var _slash = instance_create_layer(x,y - 10,layer,obj_slash)
}

#endregion
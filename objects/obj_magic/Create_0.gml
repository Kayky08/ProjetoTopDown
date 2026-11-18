#region variaveis
// Atributos
spd = 5
spd_saved = 0
bounce = false
fear = false
damage = obj_hand_left.damage

paused = false
#endregion

#region funções
check_pause = function (){
    if global.pause and !paused {
        spd_saved   = speed
        speed       = 0
        image_speed = 0
        paused = true
    }
    else if (!global.pause && paused) {
        speed = spd_saved;
        image_speed = 1;
        paused = false;
    }
}
#endregion
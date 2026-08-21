global.debug = false

function create_weapon(_name, _description, _sprite, _damage, _contdown) constructor {
    
    static weapon_qtd = 0;
    
    weapon_id   = ++weapon_qtd;
    name        = _name;
    description = _description;
    sprite      = _sprite;
    damage      = _damage;
    contdown    = _contdown;
}

var pulse = new create_weapon(
    "Pulso", 
    "Um golpe mágico que fica emanando do mago entre intervalos",
    spr_pulse,
    1,
    5    
)
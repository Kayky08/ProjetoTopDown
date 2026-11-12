// Dando dano e se destruindo ao tocar o inimigo
if(!array_contains(hit_list, other.id)){
    array_push(hit_list, other.id);
    other.damage(obj_player.ws_damage);
}
// Empurrando o inimigo ao entrar em contato
other.x -= dcos(point_direction(other.x,other.y, x, y) + push_force)
other.y += dsin(point_direction(other.x,other.y, x, y) + push_force)

// Verificando se o inimigo ja levou dano
if(!array_contains(hit_list, other.id)){
    array_push(hit_list, other.id);
    other.damage(damage);
}
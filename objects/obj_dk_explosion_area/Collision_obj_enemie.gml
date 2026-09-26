if(!array_contains(hit_list, other.id)){
    array_push(hit_list, other.id);
    other.damage(damage);
}
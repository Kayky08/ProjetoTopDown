timer++

other.x -= dcos(point_direction(other.x,other.y, x, y) + push_force)
other.y += dsin(point_direction(other.x,other.y, x, y) + push_force)

if(!array_contains(hit_list, other.id)){
    array_push(hit_list, other.id);
    other.damage(damage);
}

if timer > time{
    instance_destroy();
}
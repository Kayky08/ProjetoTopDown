var _chance = random(100)

if _chance < other.chance {
    instance_create_layer(x,y + sprite_height/2,"efects",obj_lg_laiser)
    state = "light"
    instance_destroy()
}
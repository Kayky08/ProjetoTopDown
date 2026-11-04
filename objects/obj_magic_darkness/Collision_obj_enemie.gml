// Se destruindo ao tocar o inimigo
instance_destroy()

// Criando a area de para puxar os inimigos
area_push = instance_create_layer(other.x,other.y,layer,obj_dk_push_area)
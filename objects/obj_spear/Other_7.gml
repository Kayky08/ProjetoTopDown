// Quando a animação acaba trava no ultimo frame
image_index = -1
image_speed = 0

// Ativando o timer
timer_animation++

// Quando acaba a animação aciona a velocidade
if timer_animation >= time_animation {
	speed = spd
}
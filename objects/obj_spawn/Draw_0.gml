// Se desenhando
draw_self()

// Status de Debug
if(global.debug){
    draw_text(x,y+20,"state:" + string(state))
    draw_text(x,y+40,"life:" + string(life))
    draw_text(x,y+60,"s. timer:" + string(timer_spawn))
}
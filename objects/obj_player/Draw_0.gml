// Desenhando o player
draw_self()

// Ativando os textos de debug
if(global.debug){
    draw_text(x,y+20,"state:" + string(state));
    draw_text(x,y+40,"life:" + string(life));
    draw_text(x,y+60,"p. hands:" + string(position_hands));
}
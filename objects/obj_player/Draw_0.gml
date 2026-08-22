// Desenhando o player
draw_self()

// Ativando os textos de debug
if(global.debug){ 
    draw_text(x,y+20,"weapon_sec:" + string(weapon_sec));
    draw_text(x,y+40,"timer_wsec:" + string(timer_wsec_recharge));
    //draw_text(x,y+60,"p. hands:" + string(position_hands));
}
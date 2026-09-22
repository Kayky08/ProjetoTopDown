draw_self();

if(global.debug){
    draw_text(x,y+20,"state:" + string(state));
    draw_text(x,y+40,"recharge:" + string(timer_recharge));
}
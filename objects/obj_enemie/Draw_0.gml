draw_self();

draw_text(x - 15,y - 30,"life:" + string(life));

draw_path(path,x,y,false);

if(global.debug){
    draw_text(x,y+20,"state:" + string(state));
    draw_text(x,y+40,"target:" + string(target));
}
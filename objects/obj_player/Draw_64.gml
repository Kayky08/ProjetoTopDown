draw_rectangle(10,10,100,100, true);
draw_sprite_ext(icon,0,55,55,2.5,2.5,image_angle,image_blend,image_alpha);

draw_text(120,10,"life:" + string(life))

if(shoot == obj_shoot_fire){
    draw_rectangle_colour(10,700,stress * 5,650,c_red,c_red,c_red,c_red,false);
    draw_rectangle(10,700,505,650,true);
}
// Desenhando os retagulos onde ficaram a vida e a arma secundaria
draw_rectangle(10,10,100,100, true);
draw_rectangle(10,110,70,170, true);

// Desenhando os icones da magia e da arma secundaria
draw_sprite_ext(icon,0,55,55,2.5,2.5,image_angle,image_blend,image_alpha);
draw_sprite_ext(icon_sec,0,18,115,2.5,2.5,image_angle,image_blend,image_alpha);

// Desenhando o texto da vida atual
draw_text(120,10,"life:" + string(life))

// Desenhando o nivel de estresse da magia de fogo
if(lhand.shoot == obj_magic_fire){
    draw_text(10,650,"Left Hand:")
    draw_rectangle_colour(10,700,lhand.stress * 5,670,c_red,c_red,c_red,c_red,false);
    draw_rectangle(10,700,505,670,true);
}

if(rhand.shoot == obj_magic_fire){
    draw_text(10,650,"Right Hand:")
    draw_rectangle_colour(10,700,rhand.stress * 5,670,c_red,c_red,c_red,c_red,false);
    draw_rectangle(10,700,505,670,true);
}
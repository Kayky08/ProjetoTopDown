draw_self();

draw_text(x - 15,y - 30,"life:" + string(life));

draw_path(path,x,y,false);

if(global.debug){
    draw_text(x,y+20,"state:" + string(state));
    draw_text(x,y+40,"timer debuff:" + string(timer));
    draw_text(x,y+60,"speed:" + string(speed));
}

if (state = "freeze") {
    gpu_set_blendmode(bm_add); // modo de adição (brilho)
    draw_sprite_ext(
        sprite_index, // sprite que vai ser desenhado
        image_index, // imagem que vai ser desenhado
        x, // posição x
        y, // posição y
        image_xscale * 1.2, // tamanho da escala x
        image_yscale * 1.2, // tamanho da escala y
        image_angle, // angulo da imagem
        make_color_rgb(0, 0, 255), // cor da sprite
        0.5 // transparência
    );
    gpu_set_blendmode(bm_normal); // volta ao normal
}
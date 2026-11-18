// Desenhando a barra de vida do jogador
draw_set_color(c_black);
draw_rectangle(150, 100, 450, 130, false);

var _life_percent = clamp(obj_player.life / obj_player.max_life, 0, 1);
var _life_current_width = 300 * _life_percent;

draw_set_color(c_red);
draw_rectangle(150, 100, 150 + _life_current_width, 130, false);

draw_sprite_ext(spr_lifebar,0,10,10,2.5,2.5,image_angle,image_blend,image_alpha)
draw_sprite_ext(obj_player.icon_sec,0,33,33,2.5,2.5,image_angle,image_blend,image_alpha);
draw_sprite_ext(obj_player.icon,0,117,115,2.5,2.5,image_angle,image_blend,image_alpha);

// Criando a barra de XP
draw_set_color(c_black);
draw_rectangle(0,700,room_width,720, false)

var _xp_percent = clamp(obj_player.xp / obj_player.max_xp, 0, 1);
var _xp_current_width = room_width * _xp_percent;

draw_set_color(c_blue);
draw_rectangle(0,700,0 + _xp_current_width, 720, false);

// Definindo a cor para branco
draw_set_color(c_white);

//if global.pause {
    //draw_pause()
//}

if global.pause{//and obj_player.level_upgrade{
    draw_level_up()
}
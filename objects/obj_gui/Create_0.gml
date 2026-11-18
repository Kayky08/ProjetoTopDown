#region variaveis
global.upgrade_menu = ds_grid_create(4,2)
ds_grid_clear(global.upgrade_menu, 0)
#endregion

#region funções
draw_pause = function (){
    var _w = display_get_gui_width()
    var _h = display_get_gui_height()
    
    draw_set_alpha(.2)
    draw_rectangle_colour(0,0,_w,_h,c_purple,c_purple,c_purple,c_purple, false)
    draw_set_alpha(1)
}

draw_level_up = function (){
    // Pegando a posção de seleção
    static _sel_x = 0
    static _sel_y = 0
    
    // Pegando o tamanho do display
    var _w = display_get_gui_width()
    var _h = display_get_gui_height()
    
    // Pegando o tamanho do sprite
    //var _spr_w = sprite_get_width(spr_bg_upgrade)
    //var _spr_h = sprite_get_height(spr_bg_upgrade)
    
    // Controlar a porcentagem da tela ocupada
    var _upm_w = _w * .8
    var _upm_h = _h * .8
    
    // Calculando a posição do menu
    var _upm_x = _w/2 - _upm_w/2
    var _upm_y = _h/2 - _upm_h/2
    
    // Criando a margem
    var _marg_x = _upm_w * .025
    var _marg_y = _upm_h * .05
    
    // Criaando o layout dos cards
    var _cards_x = _upm_x + _marg_x
    var _cards_y = _upm_y + _marg_y
    var _cards_w = _upm_w - _marg_x * 2
    var _cards_h = _upm_h - _marg_y * 2
    
    // Grid
    var _rows = ds_grid_width(global.upgrade_menu)
    var _cols = ds_grid_height(global.upgrade_menu)
    
    // Pegando o tamanho da sprite dos cards
    var _spr_w = sprite_get_width(spr_card_epic)
    var _spr_h = sprite_get_height(spr_card_epic)
    
    // Margen entre os cards
    var _mgs_x = _cards_w * 0.025
    var _mgs_y = _cards_h * 0.025
    
    //Pegando o valor de acada elemento da grid
    var _grid_w = (_cards_w - _rows * _mgs_x) div _rows
    var _grid_h = (_cards_h - _cols * _mgs_y) div _cols
    
    // Pegando a posição do mouse no GUI
    var _mouse_x = device_mouse_x_to_gui(0)
    var _mouse_y = device_mouse_y_to_gui(0)
    
    // Deixando o fundo azul
    draw_set_alpha(.2)
    draw_rectangle_colour(0,0,_w,_h,c_blue,c_blue,c_blue,c_blue, false)
    draw_set_alpha(1)
    
    // Desenhando a caixa com dimesões especificas
    draw_sprite_stretched(spr_bg_upgrade, 0, _upm_x, _upm_y,_upm_w, _upm_h)
    
    // Desenhando a area do card
    //draw_rectangle( _cards_x, _cards_y,_cards_x + _cards_w, _cards_y + _cards_h, true)
    
    for(var i = 0; i < _rows; i++){
        for(var j = 0;j < _cols; j++){
            var _x1 = _cards_x + _grid_w * i + (_mgs_x * i) + _mgs_x / 2
            var _y1 = _cards_y + _grid_h * j + (_mgs_y * j) + _mgs_y / 2
            
            var selection = (_sel_x == i && _sel_y == j)
            
            // Checando a posição do mouse no espaço dos itens
            _sel_x = (_mouse_x - _cards_x - (_marg_x * i)) div _grid_w
            _sel_y = (_mouse_y - _cards_y - (_marg_y * j)) div _grid_h
            
            show_debug_message(_sel_x)
            show_debug_message(_sel_y)
            
            draw_sprite_stretched(spr_card_epic, selection, _x1, _y1, _grid_w, _grid_h)
        } 
    }
}
#endregion
// Comandos para Debugar
comands = function (){
    // Inputs
    debug   = keyboard_check_pressed(vk_tab);
    restart = keyboard_check_pressed(ord("R"));
    
    // Definindo ações para os inputs
    if (restart) room_restart();
    if (debug) global.debug = !global.debug;
}
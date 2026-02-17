//comands
comands = function (){
    debug = keyboard_check_pressed(vk_tab);
    restart = keyboard_check_pressed(ord("R"));
    
    if (restart) room_restart();
    if (debug) global.debug = !global.debug; 
}
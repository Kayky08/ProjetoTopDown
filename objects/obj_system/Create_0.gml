// Comandos para Debugar
comands = function (){
    // Inputs
    debug   = keyboard_check_pressed(vk_tab)
    restart = keyboard_check_pressed(ord("R"))
    pause   = keyboard_check_pressed(ord("P")) or keyboard_check_pressed(vk_escape)
    
    // Definindo ações para os inputs
    if (restart) room_restart()
    if (debug)   global.debug = !global.debug
    if (pause)   global.pause = !global.pause
    
    if keyboard_check_pressed(vk_numpad1) {
        if object_exists(obj_pulse){
            instance_destroy(obj_pulse)
        }
        
        obj_player.weapon_sec = "bombs"
        obj_player.icon_sec   = spr_icon_bombs
    }
    if keyboard_check_pressed(vk_numpad2) {
        obj_player.weapon_sec = "pulses"
        obj_player.icon_sec   = spr_icon_pulse
    }
    if keyboard_check_pressed(vk_numpad3) {
        if object_exists(obj_pulse){
            instance_destroy(obj_pulse)
        }
        
        obj_player.weapon_sec = "slashs"
        obj_player.icon_sec   = spr_icon_slash
    }
    if keyboard_check_pressed(vk_numpad4) {
        if object_exists(obj_pulse){
            instance_destroy(obj_pulse)
        }
        
        obj_player.weapon_sec = "spears"
        obj_player.icon_sec   = spr_icon_spears
    }
}
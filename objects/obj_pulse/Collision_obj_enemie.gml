// Dando dano depois de um determinado tempo
if !global.pause {
    timer_recharge++
    
    if(timer_recharge >= time_recharge){
        timer_recharge = 0
        
        other.damage(damage)
    }
}
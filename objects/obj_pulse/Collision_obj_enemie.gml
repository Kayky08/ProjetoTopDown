timer_recharge++

if(timer_recharge >= time_recharge){
    timer_recharge = 0
    
    other.damage(damage)
}
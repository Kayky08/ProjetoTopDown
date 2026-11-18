// Marcar o tempo
timer = 0

seconds = 0
minutes = 0
hours = 0

stopwatch = function (){
    if !global.pause{
        timer++
        
        if timer >= 60{
            timer = 0
            seconds++
        }
        if seconds >= 60{
            seconds = 0
            minutes++
        }
        if minutes >= 60{
            minutes = 0
            hours++
        }
    }
}
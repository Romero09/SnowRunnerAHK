isCCEnabled := 0
return

#IfWinActive ahk_class SnowRunner
~Numpad8::
    moveGear("up")
return
~Numpad4::
    moveGear("left")
return
~Numpad6::
    moveGear("right")
return
~Numpad5::
    moveGear("down")
return

~w::
~s::
    isCCEnabled = 0
return

^w:: ; press (Control + w) to enable cruise control
    enableCC()
return
#IfWinActive

moveGear(position) {
    x := (A_ScreenWidth // 2)
    y := (A_ScreenHeight // 2)
    speed := 10 ; Change value to make mouse move faster or slower between 0 and 100.
    distance := 25 ; Distance for mouse to move in px.
    send, {Shift DOWN}
    mousemove, x, y, 1
    if (position = "up") 
    {
        mousemove, 0, -distance, speed, r
    }
    if (position = "left") 
    {
        mousemove, -distance, 0, speed, r
    }
    if (position = "down") 
    {
        mousemove, 0, distance, speed, r
    }
    if (position = "right") 
    {
        mousemove, distance, 0, speed, r
    }
    
    send {Shift UP}
}

enableCC()
{
    global isCCEnabled
    isCCEnabled = 1
    Loop
    {
        if WinActive("ahk_class SnowRunner") {
        } else {
            isCCEnabled = 0
        }
        if (isCCEnabled = 0)
        {
            break
        }
        send, {w DOWN}
        sleep, 10
    }
}

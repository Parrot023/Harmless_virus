msgbox, My super obnoxius but harmless virus has been isntalled on your computer, all mouse movements have been disabled and you cant click your mouse. the only way to move your mouse is to clik ctrl+h and type the coordinates you want your mouse to got to

#persistent
coordmode, mouse, screen

mousegetpos, sx, sy

settimer, check, 25
return

dont_check = 0
max_movement = 1
v_enabled = 0

check:
mousegetpos, cx, cy
if (v_enabled == 1)
{
    if dont_check = 0
    {
        if (cx != sx or cy != sy)
        {
        ; mouse has moved, calculate by how much
            if (cx > (sx+%max_movement%) or cx < (sx-%max_movement%) or cy > (sy+%max_movement%) or cy < (sy-%max_movement%))
            {
                mousegetpos, sx, sy ; get new mouse position
                MouseMove, A_ScreenWidth // 2, A_ScreenHeight // 2
                dont_check = 1
            }  
        }
    } Else 
    {
        dont_check = 0
        mousegetpos, sx, sy ; get new mouse position

    }
      
}    
return

^f::
v_enabled = 0
msgbox, You disabled my harmless virus %msg_enabled%
return

^g::
v_enabled = 1
msgbox, You enabled my harmless virus %msg_enabled%
return

^h::
InputBox, x, X LOCATION, Please enter an x location to move your mouse to
InputBox, y, Y LOCATION, Please enter a y location to move your mouse to
v_enabled = 0
MouseClick, left, %x%, %y%
v_enabled = 1
return

#if v_enabled
{
    LButton::
    SoundBeep, 1000, 100
    return


    MButton::
    SoundBeep, 1000, 100
    return

    RButton::
    SoundBeep, 1000, 100
    return

}


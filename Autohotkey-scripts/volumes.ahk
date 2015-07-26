﻿#NoEnv 
SendMode Input 
#SingleInstance Force
Process, Priority, ,High
#InstallKeybdHook
#InstallMouseHook
#UseHook 

#MenuMaskKey vk07  ;  is used to mask Win or Alt keyup events
; http://ahkscript.org/docs/commands/_MenuMaskKey.htm
return


~RButton::
if !GetKeyState("LButton", "P")
{
   If (A_PriorHotkey != A_ThisHotkey OR A_TimeSincePriorHotkey > 500)
   return
{

 If MouseIsOver("ahk_class Shell_TrayWnd")
   {

   Sleep 200  ; give time for the context menu to appear

   Send {Esc} ; close it
run ,open f:/
}
else
{

   Sleep 200  ; give time for the context menu to appear
   Send {Esc} ; close it
send {CTRLDOWN}v{CTRLUP}
}
   TrayTip,,You double clicked! ; Your script would go here
return
   }
 }
Return

~RButton & MButton::
 Send {Volume_Up 10}
 SetTimer, CloseContextMenu, 50
return
#MaxThreadsPerHotkey, 2 
~RButton & WheelUp::  
 Send {LCtrl down}{Tab}{LCtrl up}
 SetTimer, CloseContextMenu, 50
return

#MaxThreadsPerHotkey, 2 
~RButton & WheelDown::
 Send {Shift down}{LCtrl down}{Tab}{LCtrl up}{Shift up}
 SetTimer, CloseContextMenu, 50
return

;-------------------------------------------------------------------

~RButton & LButton::
 Send {Volume_Down 10}
 SetTimer, CloseContextMenu, 50
return
 CloseContextMenu:
KeyWait, RButton, R
Send {RCtrl DOWN}{Alt DOWN}{Alt UP}{RCtrl UP}
SetTimer, CloseContextMenu, off
return
;-----------------------------------------------------

#IfWinNotActive ahk_class CabinetWClass

{
~LButton & RButton::
If (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 300)
{
Send, #d

TrayTip,,paste done ; Your script would go here
return
}
Else
Send, {CTRLDOWN}c{CTRLUP}
	   TrayTip,,copy done ; Your script would go here
	   return
}
return

~Rbutton & XButton2::Run, "g:\ahk scripts\ws.lnk"
return
~RButton & XButton1::
WinGetActiveTitle, Title
If Instr(Title, "Google Chrome") > 0
{
   WinMinimize, A
}
else
if WinExist("ahk_class Chrome_WidgetWin_1")
{
	WinActivate
	WinMaximize
}
else
    Run Chrome.exe
return

#If MouseIsOver("ahk_class Shell_TrayWnd")
{
WheelUp::
WinGetActiveTitle, Title
If Instr(Title, "stuff") > 0
{
   WinMinimize, A
}
else
if WinExist("ahk_class CabinetWClass")
{
	WinActivate
	WinMaximize
}
else
    Run ,open g:/
return

WheelDown::
#MaxThreadsPerHotkey 2
Send {Volume_Mute}
SoundPlay *-1
return
}
return
MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

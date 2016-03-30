CoordMode, Mouse, Screen
;This script hides the chrome address bar by displaying a fake location ba pngr on the top of google ch
; Useful trick to have more privacy
;overlays on chrome and minimize itself if chrome is minimize
; Has transparent area where google chrome back, next button are to make it work with other script which use those button images
; still to do is is to make it resize according to google chrome window's size.
;demo is at https://github.com/1nsp1r3rnzt/Autohotkey-scripts/blob/master/Autohotkey-scripts/chrome%20demo.gif?raw=true
Gui, Color, CABAFF
Gui +LastFound
winset,transcolor,CABAFF
gui,-caption +alwaysontop
Gui -border -caption +AlwaysOnTop +ToolWindow
;; how often to get the mouse position in milliseconds
UPDATE_INTERVAL := 10
;; make the script run forever
#Persistent
SetTimer, WatchCursor, %UPDATE_INTERVAL%
return

WatchCursor:
MouseGetPos, x, y
	If ( y > 124) { ;if cursors in top right region x < 2560 &&

	IfWinActive, ahk_class Chrome_WidgetWin_1
{

	WinGetPos, XWin, YWin,width,height, ahk_class Chrome_WidgetWin_1 
	
	Gui, add, picture,, d:\fake.png
Gui, Show,x-10 y-10 NoActivate
}
sleep 100
return
    }
    else
	{
	
	Gui, Hide ;hide it
	return
	}

#IfWinActive

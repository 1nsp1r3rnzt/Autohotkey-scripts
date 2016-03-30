#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 pressing ` (backtick) will quickly paste the copied text or image in evernote and return the focus  last active windows using al tab
;useful for copying parts of a page and quickly paste in evernote
; evernote must be opened and new note must be created for it to work
`:: 
#IfWinExist ahk_class ENMainFrame
WinActivate   ,ahk_class ENMainFrame
send {enter}
sleep 100
send ^v
sleep 100
Send, {ALTDOWN}{TAB}ALTUP}
send, {enter}
#IfWinActive

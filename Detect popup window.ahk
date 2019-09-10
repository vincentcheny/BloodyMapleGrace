#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance

#Persistent
checkInterval := 5*60*1000
SetTimer, AFunction, %checkInterval% ; execute A in regular time
return

AFunction:
IfWinExist, ahk_exe chrome.exe ; There is a situation and BFunction is executable
{
     Gosub, BFunction
}
return

BFunction:
MsgBox, 4,, You have a situation. Would you like to execute B? (press Yes or No)
IfMsgBox Yes
msgbox You execute B.
else
MsgBox You refuse to execute B.
return

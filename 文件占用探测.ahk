#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

#IfWinActive 文件正在使用
	#c::
	{
		WinGetActiveTitle, title
		WinGetText, content
		MsgBox, The title is `n%title%`nThe content is `n%content%
	}
#IfWinActive

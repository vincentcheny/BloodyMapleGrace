CapsLock::
	send {Space}
return

CapsLock & h::
	Send {Left}
return

CapsLock & j::
	Send {Down}
return

CapsLock & k::
	Send {Up}
return

CapsLock & l::
	Send {Right}
return

#IfWinActive ahk_class WeChatMainWndForPC
$^c::
clipboard = 
Send ^c
ClipWait, 1
{
	clipboard := RegExReplace(clipboard, "^[^枫][^`n]{1,10}:`n","小明：")	
	StringReplace, clipboard, clipboard, 枫:`n, , All
	clipboard := RegExReplace(clipboard, "`n`n[^`n]{1,10}:`n","`n小明：")	
	StringReplace, clipboard, clipboard, `n`n, `n, All
}
return
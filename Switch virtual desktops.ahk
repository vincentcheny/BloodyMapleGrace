#Persistent
SetTimer, WatchCursor, 1000
MouseIsOver(WinTitle) {
     MouseGetPos,,, Win
     return WinExist(WinTitle . " ahk_id " . Win)
}

WatchCursor:
#If MouseIsOver("ahk_class Shell_TrayWnd")
{
     wheelup::
     send #^{Left}
     return
     wheeldown::
     send #^{Right}
     return
}

F & H::
send ^#{Left}

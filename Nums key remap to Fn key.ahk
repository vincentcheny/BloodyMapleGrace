conf=
(LTrim Join
1,2,3,4,
5,6,7,8,
9,0,-,=
)

htk:=StrSplit(conf,"`,")
idx := {}

Loop, Parse, conf, "`,"
{
     idx[A_LoopField] := A_Index ;`key` stores the hot key, `value` stores the index
}

conf_size := Round(StrLen(conf)*0.5) ;remove commas
Loop %conf_size%
{
     _hotkey :="$" . htk[A_Index] ;$override old behaviour
     Hotkey, %_hotkey%, Handle ;create new hot key
}
return

Handle:
input_key:=StrSplit(A_thishotkey,"$" ) ;listen to keys entered
Handle(idx[input_key[2]],input_key[2])
return

Handle(index, key)
{
     ;MsgBox %index% %key%
     ;SetTimer, wait, -200
     KeyWait, %key%, T0.15
     if ErrorLevel
     {
          send {F%index%}
     }
     else
     {
          ;MsgBox %key%
          if key = 5
               send 5
          else
          send %key%
     }
     ;MsgBox 1%ErrorLevel%
}

wait:
;MsgBox 2%ErrorLevel%

return


#a::Suspend ; Win+A pause/start

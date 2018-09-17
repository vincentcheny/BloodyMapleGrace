
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
	idx[A_LoopField] := A_Index ;以热键内容为key，以索引位置为value
}

conf_size := Round(StrLen(conf)*0.5) ;去除逗号
Loop %conf_size%
{
	_hotkey :="$" . htk[A_Index] ;$覆盖原按键功能
	Hotkey, %_hotkey%, Handle ;创建新热键
}
return

Handle:
	input_key:=StrSplit(A_thishotkey,"$" ) ;提取键入值
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


#a::Suspend ; Win+A 暂停/启用
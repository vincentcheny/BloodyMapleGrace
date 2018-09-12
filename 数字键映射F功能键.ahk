
edit_mode := 0

conf=
(LTrim Join
1,2,3,4,
5,6,7,8,
9
)

htk:=StrSplit(conf,"`,")
idx := {} ;根据热键内容获取索引位置

Loop, Parse, conf, "`,"
{
	idx[A_LoopField] := A_Index
}

conf_size := Round(StrLen(conf)*0.5)
Loop %conf_size%
{
	_hotkey :="$" . htk[A_Index] ;覆盖原按键功能
	Hotkey, %_hotkey%, Handle
}
return

Handle:
	test:=StrSplit(A_thishotkey,"$" ) 
	Handle(idx[test[2]], edit_mode)  ;根据热键来激活不同位置的窗口 
return

Handle(num, edit_mode)
{
	if (edit_mode = 0)
	{
		if (num = 0)
			num := 10
		send {F%num%}
		;msgbox send F%num%
	}
	else 
	{
		sendinput %num%
		;msgbox send %num%
	}
}

~LButton::
	if (A_Cursor = "IBeam" )
	{
		edit_mode := 1
	}
	else
	{
		edit_mode := 0
	}
return

$-::
	if (edit_mode = 0)
	{
		send {F11}
	}
	else 
	{
		send -
	}
return

$=::
	if (edit_mode = 0)
	{
		send {F12}
	}
	else 
	{
		send {=}
	}
return

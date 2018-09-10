
edit_mode := 1
~LButton::
	
	if (A_Cursor = "IBeam" )
	{
		edit_mode := 0
	}
	else
	{
		edit_mode := 1
	}
return
$1::
	if (edit_mode = 1)
	{
		send {F1}
	}
	else 
	{
		send 1
	}
return
$2::
	if (edit_mode = 1)
	{
		send {F2}
	}
	else 
	{
		send 2
	}
return
$3::
	if (edit_mode = 1)
	{
		send {F3}
	}
	else 
	{
		send 3
	}
return
$4::
	if (edit_mode = 1)
	{
		send {F4}
	}
	else 
	{
		send 4
	}
return
$5::
	if (edit_mode = 1)
	{
		send {F5}
	}
	else 
	{
		send 5
	}
return
$6::
	if (edit_mode = 1)
	{
		send {F6}
	}
	else 
	{
		send 6
	}
return
$7::
	if (edit_mode = 1)
	{
		send {F7}
	}
	else 
	{
		send 7
	}
return
$8::
	if (edit_mode = 1)
	{
		send {F8}
	}
	else 
	{
		send 8
	}
return
$9::
	if (edit_mode = 1)
	{
		send {F9}
	}
	else 
	{
		send 9
	}
return
$0::
	if (edit_mode = 1)
	{
		send {F10}
	}
	else 
	{
		send 0
	}
return
$-::
	if (edit_mode = 1)
	{
		send {F11}
	}
	else 
	{
		send -
	}
return
$=::
	if (edit_mode = 1)
	{
		send {F12}
	}
	else 
	{
		send {=}
	}
return
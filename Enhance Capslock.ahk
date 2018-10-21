
CapsLock & h::
	Send ^#{Left}
return

CapsLock & l::
	Send ^#{Right}
return

CapsLock::
	KeyWait, %key%, T0.15
	if ErrorLevel
	{
		send {CapsLock}
	}
	else
	{
		send {Backspace}
	}
return


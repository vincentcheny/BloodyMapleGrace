#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

config_file := "config_openwith.ini"
section_name := "FileProgramPair"
CheckIni(config_file)

$Enter::
{
	IfWinNotActive, ahk_exe explorer.exe
	{
		send {Enter} ;preserve behaviour if Windows Explorer is not on focus
		return
	}
	file_path := GetFilePath()
	if !FileExist(file_path) or InStr(FileExist(file_path), "D")
	{
		send {Enter} ;just return if nothing is selected
		return
	}
	program_path := GetRecord(config_file, file_path)
	if program_path = Error
		send {Enter}
	else
	{
		file_path = "%file_path%"
		program_path = "%program_path%"
		Run, %program_path% %file_path%
	}
	return
}

$+Enter::
{
	IfWinNotActive, ahk_exe explorer.exe
		return
	file_path := GetFilePath()
	if !FileExist(file_path) or InStr(FileExist(file_path), "D")
	{
		return ;just return if nothing is selected
	}
	program_path := GetRecord(config_file, file_path) ;TODO: some bugs here, need future fix.
	if program_path = Error
	{
		;no record is found in the config file
		CheckIni(config_file)
		msgbox, 1, Register open program for individual file`, didn't find record of the file.`n`nPress "Proceed" to register a new open program for the file and open it`,`nPress "Cancel" to quit.
		IfMsgBox, OK
		{
			SetOpenWith(config_file,file_path)
		}
	}
	else
	{
		;record is found in the config file
		msgbox, 3, Register open program for individual file`, found record of the file.`n`nPress "Proceed" to register a new open program for the file and open it`,`nPress "Open with default" to open with default open program`,`nPress "Cancel" to quit.
		IfMsgBox, Yes
		{
			SetOpenWith(config_file,file_path)
		}
		IfMsgBox, No
		{
			IniDelete, % config_file, % section_name , % file_path
			file_path = "%file_path%"
			Run, %file_path%
		}
	}
	return
}

GetRecord(config_file, key, section_name="FileProgramPair")
{
	IniRead, addr, % config_file, % section_name, % key ;log ERROR to OutputVar if the key requested is not found
	return addr
}

CheckIni(config_file)
{
	IfNotExist, %config_file%
	{
		msgbox Config file is not found`, ready to create new one.`n`nUsage help:`n`n`t"Enter": Open the file with specified open program (use default open program if not specified before)`n`t"Shift+Enter": Change open program for the file (update or revert to default)`n`nHint: the script only works on individual file. It doesn't change the default open program registered per file extension.
		FileAppend,,%A_ScriptDir%\%config_file% ; create config file
	}
}

SetOpenWith(config_file,file_path)
{
	program_path := GetProgramPath()
	if program_path =
	{
		return
	}
	SetAddress(config_file, file_path, program_path)
	file_path = "%file_path%"
	program_path = "%program_path%"
	Run, %program_path% %file_path%
	return
}

SetAddress(config_file, key, value, section_name="FileProgramPair")
{
	try
	{
		IniWrite, % value, % config_file, % section_name, % key
	}
	catch e
	{
		msgbox An exception was thrown!`nSpecifically: %e%
		exit
	}
}

GetProgramPath()
{
	FileSelectFile, SelectedProgram, S3,,Open with..., EXE (*.exe)
	Return SelectedProgram
}

GetFilePath()
{
	clipboard_saved := ClipboardAll
	Send ^c
	Sleep, 100
	file_path := clipboard ;save the path as string
	clipboard := clipboard_saved
	return file_path
}

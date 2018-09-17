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
		send {Enter} ;当前窗口不是文件管理器时使用原键
		return
	}
	file_path := GetFilePath()
	if !FileExist(file_path) or InStr(FileExist(file_path), "D")
	{
		send {Enter} ;选中为空时直接返回
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
		return ;选中为空时直接返回
	}
	program_path := GetRecord(config_file, file_path) ;有bug
	if program_path = Error
	{
		;ini无记录
		CheckIni(config_file)
		msgbox, 1, 指定单文件默认打开方式, 未找到该文件的记录。`n`n点击“确定”为此文件关联新打开方式并打开,`n点击“取消”退出。 
		IfMsgBox, OK
		{
			SetOpenWith(config_file,file_path)
		}
	}	
	else
	{
		;ini有记录
		msgbox, 3, 指定单文件默认打开方式, 已找到该文件的记录。`n`n点击“是”为此文件关联新打开方式并打开，`n点击“否”恢复默认打开方式并打开，`n点击“取消”退出。
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
	IniRead, addr, % config_file, % section_name, % key ;没有找到请求的键时保存ERROR到OutputVar
	return addr
}

CheckIni(config_file)
{
	IfNotExist, %config_file% 
	{
		msgbox 未找到配置文件，并已重新生成配置文件。`n`n使用帮助：`n`n`t"Enter"：使用指定方式打开文件（如未指定则使用默认方式）`n`t"Shift+Enter"：修改文件打开方式（更新或恢复默认）`n`n提示：本脚本只对文件个体生效，并不改变任何类型文件的默认打开方式。
		FileAppend,,%A_ScriptDir%\%config_file% ; 创建配置文件
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
	file_path := clipboard ;将路径保存为字符串
	clipboard := clipboard_saved
	return file_path
}

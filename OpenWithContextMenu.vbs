REM usage: CScript OpenWithContextMenu.vbs commandName exeFilePath
Dim Args,exeFile,nameOfCommand,newRegistryKeyName,parentRegistryName,iconRegistryName,iconRegistryValue,newRegisteryKeyValue,WshShell

SET Args = WScript.Arguments
nameOfCommand = Args(0)
exeFile = Args(1)
parentRegistryName = "HKEY_CLASSES_ROOT\*\shell\" & nameOfCommand
newRegistryKeyName = parentRegistryName & "\command\"
iconRegistryName = parentRegistryName & "\Icon"
REM "${exeFile}" "%1"
newRegisteryKeyValue = """" & exeFile & """" & " " & """" & "%1" & """"
iconRegistryValue = exeFile & ",0"
SET WshShell = CreateObject("WScript.shell")

WshShell.RegWrite newRegistryKeyName, newRegisteryKeyValue, "REG_SZ"
REM create the icon in the registry
WshShell.RegWrite iconRegistryName, iconRegistryValue, "REG_SZ"
Set WshShell = Nothing
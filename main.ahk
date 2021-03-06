#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#SingleInstance force
#InstallKeybdHook

; create a window group called editors, add several programs to it
GroupAdd, Editors, ahk_exe sublime_text.exe
GroupAdd, Editors, ahk_exe bash.exe
GroupAdd, Editors, ahk_exe atom.exe
GroupAdd, Editors, ahk_exe Hyper.exe

RWin::AppsKey ; Open the 'context menu' when right windows key is pressed

NumpadDiv::Media_Prev ;  Turns the numpad div key into a previous track button
NumpadMult::Media_Play_Pause ;  Turns the numpad mult key into a pause button
NumpadSub::Media_Next ; Turns the numpad subtraction key into next track button

CapsLock::Esc ; Remap CapsLock to Esc for vim
F9::CapsLock ; Remap F9 so I can turn off CapsLock when it glitches and turns on

; Sends PC to sleep when I press the calculator button
vkB7::
	CoordMode, Mouse,
	MouseClick, left, 22, 1059
	Sleep, 500
	MouseClick, left, 22, 1016
	Sleep, 500
	MouseClick, left, 22, 900
Return

#IfWinNotActive, ahk_group Editors ; for all windows not in group Editors
; Allows the dash button to function normally, but sends an em-dash instead when
; the key is double tapped quicker than 250ms
~-:: ;  '~' serves to send the original keys functionality through
	if (A_PriorHotkey <> "~-" or A_TimeSincePriorHotkey > 250) { ; 250 ms
		Return
	}
	Send {Backspace} ;  Send two backspaces to delete the two dashes you just typed
	Send {Backspace}
	Send {ASC 0151} ;  Send the alt code for an em-dash
Return
#IfWinActive


; Open various folders
^Del::run, %comspec% /c start "" "\Users\Daniel-SSD\Software"
; ^End::run, %comspec% /c start "" "\Users\Daniel-SSD\Google Drive\School"
^PgDn::run, %comspec% /c start "" "\Users\Daniel-SSD\Google Drive\Business"

::odh::officialdanielhunter@gmail.com

; source and context: http://superuser.com/a/636973/124606
#IfWinActive ahk_class CabinetWClass ; File Explorer
    ^Backspace::
#IfWinActive ahk_class Notepad
    ^Backspace::
    Send ^+{Left}{Backspace}
#IfWinActive

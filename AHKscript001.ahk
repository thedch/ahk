#NoEnv  ;  Recommended for performance and compatibility with future AutoHotkey releases.
;  #Warn  ;  Enable warnings to assist with detecting common errors.
SendMode Input  ;  Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ;  Ensures a consistent starting directory.

#SingleInstance force

#InstallKeybdHook

RWin::AppsKey ; Open the 'context menu' when right windows key is pressed
NumpadDiv::Media_Prev ;  Turns the numpad div key into a previous track button

NumpadMult:: ;  Turns the numpad mult key into a pause button
Send, {Media_Play_Pause}
Return

NumpadSub::Media_Next ; Turns the numpad subtraction key into next track button

; Sends PC to sleep when I press the calculator button
vkB7::
	CoordMode, Mouse,
	MouseClick, left, 22, 1059
	Sleep, 500
	MouseClick, left, 22, 1016
	Sleep, 500
	MouseClick, left, 22, 900
Return

; -:: ;  triggers when - is pressed
	; {
; 	KeyWait, - ;  waits for - to be released
; 	;  ACS is just an alt code indicator
; 	Send, {ASC 045} ;  send the initial dash in case I don't double tap and just want a regular dash
; 	KeyWait, -, D T.3 ;  waits for up to 0.3 seconds for - to be repressed
; 	If (ErrorLevel == 0) ;  errorlevel is some built in variable, need to research this
; 		{
; 		Send {Backspace} ;  deletes the previously sent dash
; 		Send {ASC 0151} ;  sends the desired alt code for a long dash
; 		}
; 	}
; Return

; The following code allows the dash button to function normally, but sends an em-dash instead when the key is double tapped in quick succession
~-:: ;  '~' serves to send the original keys functionality through (in this case, typing a dash)
if (A_PriorHotkey <> "~-" or A_TimeSincePriorHotkey > 250) ;  Lowering this below 250 will make the hotkey difficult to activate, you'll have to double tap quite fast
{
	Return
}
IfWinActive, Sublime
{
	Return
}
Send {Backspace} ;  Send two backspaces to delete the two dashes you just typed
Send {Backspace}
Send {ASC 0151} ;  Send the alt code for an em-dash
Return

; The following function opens bash when Caps Lock is pressed twice with less than 0.3 seconds between pushes
; CapsLock::
; {
; 	KeyWait, CapsLock
; 	KeyWait, CapsLock, D T.3
; 	If (ErrorLevel == 0)
; 	{
; 		Send #r ;  Press Windows Key + R
; 		Sleep, 50 ;  Wait for 50 ms
; 		Send, bash ;  Input the string "bash"
; 		Sleep, 50 ;  Wait for 50 ms
; 		Send, {Enter} ;  Press the enter key
; 	}
; }
; Return

CapsLock::Esc

^1:: ; ILMF scripts
	CoordMode, Mouse,
	Send, {PgUp 10}
	Sleep, 400
	MouseClick, left, 1560, 295
	Sleep, 100
	MouseClick, left, 1360, 440
	Sleep, 100
	MouseClick, left, 1360, 440
	Send, ^a
	Sleep, 100
	Send, ^c
	Sleep, 100
	MouseClick, left, 1514, 302
	Sleep, 50
	MouseClick, left, 1847, 423

^2::
	Send, ^{Right}
	Send, ^{Right}
	Send, +{End}
	Send, +{Down}
	Send, +{End}
	Send, ^v
Return

^Del::run, %comspec% /c start "" "D:\Main\"

^End::run, %comspec% /c start "" "\Users\Daniel-SSD\Google Drive\School"

^PgDn::run, %comspec% /c start "" "\Users\Daniel-SSD\Google Drive\Business"

; `::run, %comspec% /c start "" "C:\Program Files (x86)\Evernote\Evernote\Evernote.exe"

; `::
; IfWinExist, Evernote
; {
; 	MsgBox, Test
; }
; else
; {
; 	MsgBox, Test1
; }

Return

^Ins::
	Send, officialdanielhunter@gmail.com
Return

; {VKAD}:
; 	MsgBox, test

;  how to write scripts: http:;www.autohotkey.com/docs/

#IfWinActive ahk_class CabinetWClass ; File Explorer
    ^Backspace::
#IfWinActive ahk_class Notepad
    ^Backspace::
    Send ^+{Left}{Backspace}
#IfWinActive

;  source and context: http:;superuser.com/a/636973/124606

;  relevant documentation links:
;  writing hotkeys
;  http:;www.autohotkey.com/docs/Hotkeys.htm
;  list of key codes (including Backspace)
;  http:;www.autohotkey.com/docs/KeyList.htm
;  the #IfWinActive directive
;  http:;www.autohotkey.com/docs/commands/_IfWinActive.htm
;  the Send command
;  http:;www.autohotkey.com/docs/commands/Send.htm

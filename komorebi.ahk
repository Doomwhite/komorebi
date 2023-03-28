#SingleInstance Force
SetTitleMatchMode(2)
SetKeyDelay(-1)

; You can generate a fresh version of this file with "komorebic ahk-library"
; #Include %A_ScriptDir%\komorebic.lib.ahk

; The functions library
#Include A_ScriptDir "\komorebic-functions.lib.ahk"

; The keybindings file
#Include A_ScriptDir "\komorebic-keybindings.ahk"

; Quit komorebi & yasb when quitting autohotkey
; OnExit("komorebic_stop")
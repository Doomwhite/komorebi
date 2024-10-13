#Requires AutoHotkey v2.0.18
#SingleInstance Force

; Get the current script's PID (Process ID)
currentPID := ProcessExist()

; Change the priority of the current script's process to High
ProcessSetPriority("High", currentPID)

; Match windows using substring matching
SetTitleMatchMode(2)

; Eliminate delay between simulated key presses
SetKeyDelay(-1)

; Eliminate delay between simulated mouse movements/clicks
SetMouseDelay(-1)

; Run script without delay between lines of code
A_BatchLines := -1

; Maximize thread priority
Thread.Priority := 10

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

KomorebiRestart() {
    RunWait("komorebic.exe stop --bar; komorebic.exe start --bar", , "Hide")
}

; Define the Hyper key combination as a variable
Ctrl := "^"
Alt := "!"
Shift := "+"
Winkey := "#"
Meh := Ctrl Alt Shift
Hyper := Meh Winkey
Modifier := Hyper 

Hotkey(Modifier "q", (_) => Komorebic("close"))
Hotkey(Modifier "m", (_) => Komorebic("minimize"))

; Focus windows
    Hotkey(Modifier "h", (_) => Komorebic("focus left"))
    Hotkey(Modifier "j", (_) => Komorebic("focus down"))
    Hotkey(Modifier "k", (_) => Komorebic("focus up"))
    Hotkey(Modifier "l", (_) => Komorebic("focus right"))

    Hotkey(Modifier "p", (_) => Komorebic("cycle-focus previous"))
    Hotkey(Modifier "n", (_) => Komorebic("cycle-focus next"))

; Move windows
    Hotkey(Modifier ";", (_) => Komorebic("cycle-move next"))
    Hotkey(Modifier ",", (_) => Komorebic("cycle-move previous"))

; Stack windows
    ; Hotkey(Modifier "Left", (_) => Komorebic("stack left"))
    ; Hotkey(Modifier "Down", (_) => Komorebic("stack down"))
    ; Hotkey(Modifier "Up", (_) => Komorebic("stack up"))
    ; Hotkey(Modifier "Right", (_) => Komorebic("stack right"))

; Resize windows
    Hotkey(Modifier "=", (_) => Komorebic("resize-axis horizontal increase"))
    Hotkey(Modifier "-", (_) => Komorebic("resize-axis horizontal decrease"))

; Manipulate windows
    ; Hotkey(Modifier "t", (_) => Komorebic("toggle-float"))
    ; Hotkey(Modifier "f", (_) => Komorebic("toggle-monocle"))

; Window manager options
    ; Hotkey(Modifier "a", (_) => Komorebic("start"))
    ; Hotkey(Modifier "r", (_) => Komorebic("check"))

    Hotkey(Modifier "F23", (_) => Komorebic("toggle-pause"))
    Hotkey(Modifier "F24", (_) => Komorebic("stop --bar"))

; Layouts
    Hotkey(Modifier "x", (_) => Komorebic("flip-layout horizontal"))
    Hotkey(Modifier "y", (_) => Komorebic("flip-layout vertical"))
    Hotkey(Modifier "]", (_) => Komorebic("cycle-layout next"))
    Hotkey(Modifier "[", (_) => Komorebic("cycle-layout previous"))
    Hotkey(Modifier "a", (_) => Komorebic("manage"))


; Workspaces
    Hotkey(Modifier "w", (_) => Komorebic("focus-workspace 0"))
    Hotkey(Modifier "e", (_) => Komorebic("focus-workspace 1"))
    Hotkey(Modifier "r", (_) => Komorebic("focus-workspace 2"))

    Hotkey(Modifier "5", (_) => Komorebic("cycle-move-to-workspace next"))

    Hotkey(Modifier "2", (_) => Komorebic("send-to-workspace 0"))
    Hotkey(Modifier "3", (_) => Komorebic("send-to-workspace 1"))
    Hotkey(Modifier "4", (_) => Komorebic("send-to-workspace 2"))


; Monitors (Não consigo testar aqui)
    Hotkey(Modifier "7", (_) => Komorebic("cycle-move-to-monitor next"))

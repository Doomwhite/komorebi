#SingleInstance Force
SetTitleMatchMode(2)
SetKeyDelay(-1)

; Some AHK keybindings
;#	Win (Windows logo key).
;!	Alt
;^	Ctrl
;+	Shift
;&	An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey. See below for details.


; Start komorebi
!^s::
{ ; V1toV2: Added bracket
komorebic_start()
return

; Exit komorebi
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^q::
{ ; V1toV2: Added bracket
komorebic_stop()
return

; Start yasb
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^y::
{ ; V1toV2: Added bracket
yasb_start()
return

; Quicksave/load
} ; V1toV2: Added Bracket before hotkey or Hotstring

!z::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe quick-save", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!x::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe quick-load", , "Hide")
return

; Change the focused window
} ; V1toV2: Added Bracket before hotkey or Hotstring

!j::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe cycle-focus next", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!k::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe cycle-focus previous", , "Hide")
return

; Move the focused window in a given direction
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^j::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe cycle-move next", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^k::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe cycle-move previous", , "Hide")
return

; Resize windows
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^l::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe resize-axis horizontal increase", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^h::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe resize-axis horizontal decrease", , "Hide")
return

; Stack the focused window in a given direction
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^Left::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe stack left", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^Down::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe stack down", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^Up::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe stack up", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^Right::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe stack right", , "Hide")
return

!}::
RunWait("komorebic.exe cycle-stack next", , "Hide")
return

!{::
RunWait("komorebic.exe cycle-stack previous", , "Hide")
return

; Unstack the focused window
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^d::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe unstack", , "Hide")
return

; Promote the focused window to the top of the tree
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^Enter::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe promote", , "Hide")
return

; Switch to an equal-width, max-height column layout on the main workspace
;!c::
;RunWait, komorebic.exe workspace-layout 0 0 columns, , Hide
;return

; Switch to the default bsp tiling layout on the main workspace
;!t::
;RunWait, komorebic.exe workspace-layout 0 0 bsp, , Hide
;return

; Toggle the Monocle layout for the focused window
} ; V1toV2: Added Bracket before hotkey or Hotstring
!f::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe toggle-monocle", , "Hide")
return

; Toggle native maximize for the focused window
} ; V1toV2: Added Bracket before hotkey or Hotstring
!m::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe toggle-maximize", , "Hide")
return

; Toggle native minimize for the focused window
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^m::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe toggle-minimize", , "Hide")
return

; Flip horizontally
} ; V1toV2: Added Bracket before hotkey or Hotstring
!n::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe flip-layout horizontal", , "Hide")
return

; Flip vertically
} ; V1toV2: Added Bracket before hotkey or Hotstring
!v::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe flip-layout vertical", , "Hide")
return

; Force a retile if things get janky
; !r::
; RunWait, komorebic.exe retile, , Hide
; return

; Float the focused window
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^f::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe toggle-float", , "Hide")
return

; Reload ~/komorebi.ahk
} ; V1toV2: Added Bracket before hotkey or Hotstring
!o::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe reload-configuration", , "Hide")
return

; Pause responding to any window events or komorebic commands
} ; V1toV2: Added Bracket before hotkey or Hotstring
!p::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe toggle-pause", , "Hide")
return

; Manages the focused window
} ; V1toV2: Added Bracket before hotkey or Hotstring
!=::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe manage", , "Hide")
return

; Unmanages the focused window
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^=::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe unmanage", , "Hide")
return

; Pause responding to any window events or komorebic commands
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^p::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe toggle-tiling", , "Hide")
return

; Switch to workspace
} ; V1toV2: Added Bracket before hotkey or Hotstring
!w::
{ ; V1toV2: Added bracket
Send("!")
RunWait("komorebic.exe focus-workspace 0", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!e::
{ ; V1toV2: Added bracket
Send("!")
RunWait("komorebic.exe focus-workspace 1", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!r::
{ ; V1toV2: Added bracket
Send("!")
RunWait("komorebic.exe focus-workspace 2", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!1::
{ ; V1toV2: Added bracket
Send("!")
RunWait("komorebic.exe focus-workspace 3", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!2::
{ ; V1toV2: Added bracket
Send("!")
RunWait("komorebic.exe focus-workspace 4", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!u::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe cycle-workspace previous", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!i::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe cycle-workspace next", , "Hide")

; Send window to workspace
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^w::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe send-to-workspace 0", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^e::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe send-to-workspace 1", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^r::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe send-to-workspace 2", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^1::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe send-to-workspace 3", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^2::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe send-to-workspace 4", , "Hide")
return

; Resize windows
} ; V1toV2: Added Bracket before hotkey or Hotstring
!Left::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe resize-axis horizontal decrease", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!Right::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe resize-axis horizontal increase", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!Down::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe resize-axis vertical decrease", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!Up::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe resize-axis vertical increase", , "Hide")
return

; Monitor
!;::
RunWait("komorebic.exe cycle-monitor next", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!,::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe cycle-monitor previous", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!7::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe move-to-monitor 0", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!8::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe move-to-monitor 1", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!9::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe move-to-monitor 2", , "Hide")
return

; Send window to workspace
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^7::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe send-to-monitor 0", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^8::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe send-to-monitor 1", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^9::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe send-to-monitor 2", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^+7::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe move-workspace-to-monitor 0", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^+8::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe move-workspace-to-monitor 1", , "Hide")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

!^+9::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe move-workspace-to-monitor 2", , "Hide")
return

; Misc

; Closes the focused window
} ; V1toV2: Added Bracket before hotkey or Hotstring
!q::
{ ; V1toV2: Added bracket
RunWait("komorebic.exe close", , "Hide")
return

; Opens wezterm
} ; V1toV2: Added Bracket before hotkey or Hotstring
!^t::
{ ; V1toV2: Added bracket
RunWait("wezterm.exe", , "Hide")
return
} ; V1toV2: Added bracket in the end

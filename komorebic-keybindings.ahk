#SingleInstance Force
SetTitleMatchMode, 2
SetKeyDelay, -1
SetBatchLines, -1

; Some AHK keybindings
;#	Win (Windows logo key).
;!	Alt
;^	Ctrl
;+	Shift
;&	An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey. See below for details.


; Start komorebi
!^s::
komorebic_start()
return

; Exit komorebi
!^q::
komorebic_stop()
return

; Start yasb
!^y::
yasb_start()
return

; Quicksave/load

!z::
RunWait, komorebic.exe quick-save, , Hide
return

!x::
RunWait, komorebic.exe quick-load, , Hide
return

; Change the focused window

!j::
RunWait, komorebic.exe cycle-focus next, , Hide
return

!k::
RunWait, komorebic.exe cycle-focus previous, , Hide
return

; Move the focused window in a given direction

!^j::
RunWait, komorebic.exe cycle-move next, , Hide
return

!^k::
RunWait, komorebic.exe cycle-move previous, , Hide
return

; Resize windows

!^l::
RunWait, komorebic.exe resize-axis horizontal increase, , Hide
return

!^h::
RunWait, komorebic.exe resize-axis horizontal decrease, , Hide
return

; Stack the focused window in a given direction
!^Left::
RunWait, komorebic.exe stack left, , Hide
return

!^Down::
RunWait, komorebic.exe stack down, , Hide
return

!^Up::
RunWait, komorebic.exe stack up, , Hide
return

!^Right::
RunWait, komorebic.exe stack right, , Hide
return

!}::
RunWait, komorebic.exe cycle-stack next, , Hide
return

!{::
RunWait, komorebic.exe cycle-stack previous, , Hide
return

; Unstack the focused window
!^d::
RunWait, komorebic.exe unstack, , Hide
return

; Promote the focused window to the top of the tree
!^Enter::
RunWait, komorebic.exe promote, , Hide
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
!f::
RunWait, komorebic.exe toggle-monocle, , Hide
return

; Toggle native maximize for the focused window
!m::
RunWait, komorebic.exe toggle-maximize, , Hide
return

; Toggle native minimize for the focused window
!^m::
RunWait, komorebic.exe toggle-minimize, , Hide
return

; Flip horizontally
!n::
RunWait, komorebic.exe flip-layout horizontal, , Hide
return

; Flip vertically
!v::
RunWait, komorebic.exe flip-layout vertical, , Hide
return

; Force a retile if things get janky
; !r::
; RunWait, komorebic.exe retile, , Hide
; return

; Float the focused window
!^f::
RunWait, komorebic.exe toggle-float, , Hide
return

; Reload ~/komorebi.ahk
!o::
RunWait, komorebic.exe reload-configuration, , Hide
return

; Pause responding to any window events or komorebic commands
!p::
RunWait, komorebic.exe toggle-pause, , Hide
return

; Manages the focused window
!=::
RunWait, komorebic.exe manage, , Hide
return

; Unmanages the focused window
!^=::
RunWait, komorebic.exe unmanage, , Hide
return

; Pause responding to any window events or komorebic commands
!^p::
RunWait, komorebic.exe toggle-tiling, , Hide
return

; Switch to workspace
!w::
Send !
RunWait, komorebic.exe focus-workspace 0, , Hide
return

!e::
Send !
RunWait, komorebic.exe focus-workspace 1, , Hide
return

!r::
Send !
RunWait, komorebic.exe focus-workspace 2, , Hide
return

!1::
Send !
RunWait, komorebic.exe focus-workspace 3, , Hide
return

!2::
Send !
RunWait, komorebic.exe focus-workspace 4, , Hide
return

!u::
RunWait, komorebic.exe cycle-workspace previous, , Hide
return

!i::
RunWait, komorebic.exe cycle-workspace next, , Hide

; Send window to workspace
!^w::
RunWait, komorebic.exe send-to-workspace 0, , Hide
return

!^e::
RunWait, komorebic.exe send-to-workspace 1, , Hide
return

!^r::
RunWait, komorebic.exe send-to-workspace 2, , Hide
return

!^1::
RunWait, komorebic.exe send-to-workspace 3, , Hide
return

!^2::
RunWait, komorebic.exe send-to-workspace 4, , Hide
return

; Resize windows
!Left::
RunWait, komorebic.exe resize-axis horizontal decrease, , Hide
return

!Right::
RunWait, komorebic.exe resize-axis horizontal increase, , Hide
return

!Down::
RunWait, komorebic.exe resize-axis vertical decrease, , Hide
return

!Up::
RunWait, komorebic.exe resize-axis vertical increase, , Hide
return

; Monitor
!;::
RunWait, komorebic.exe cycle-monitor next, , Hide
return

!,::
RunWait, komorebic.exe cycle-monitor previous, , Hide
return

!7::
RunWait, komorebic.exe move-to-monitor 0, , Hide
return

!8::
RunWait, komorebic.exe move-to-monitor 1, , Hide
return

!9::
RunWait, komorebic.exe move-to-monitor 2, , Hide
return

; Send window to workspace
!^7::
RunWait, komorebic.exe send-to-monitor 0, , Hide
return

!^8::
RunWait, komorebic.exe send-to-monitor 1, , Hide
return

!^9::
RunWait, komorebic.exe send-to-monitor 2, , Hide
return

!^+7::
RunWait, komorebic.exe move-workspace-to-monitor 0, , Hide
return

!^+8::
RunWait, komorebic.exe move-workspace-to-monitor 1, , Hide
return

!^+9::
RunWait, komorebic.exe move-workspace-to-monitor 2, , Hide
return

; Misc

; Closes the focused window
!q::
RunWait, komorebic.exe close, , Hide
return

; Opens wezterm
!^t::
RunWait, wezterm.exe, , Hide
return
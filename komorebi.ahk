; Komorebi AHK Script Documentation
;-----------------------------------
; This script is designed to interact with `komorebic.exe`, a tiling window manager for Windows.
; The script optimizes performance, sets up hotkeys, and provides commands to control the tiling behavior.
; Below is an explanation of the key sections and logic used in the script.

; General Configuration
;----------------------
#Requires AutoHotkey v2.0.18
; Ensures the script uses the correct version of AutoHotkey for compatibility.

#SingleInstance Force
; Ensures only one instance of this script can run at any time. If the script is already running,
; it will stop the previous instance and run a new one.

; Process Management
;-------------------
; Get the current script's Process ID (PID) using the ProcessExist function.
currentPID := ProcessExist()

; Set the process priority of the current script to "High" to ensure it has higher CPU priority
; compared to other processes. This helps in improving the responsiveness of the script.
ProcessSetPriority("High", currentPID)

; Input Handling
;---------------
; SetTitleMatchMode(2)
; Allows window matching based on substrings, meaning windows can be identified by partial matches
; of their titles rather than full title matches.

; SetKeyDelay(-1)
; SetMouseDelay(-1)
; Removes any delay between simulated key presses and mouse movements. This ensures that commands
; such as window management or simulated inputs are executed immediately without delay.

A_BatchLines := -1
; The script will run without pausing between lines of code, allowing it to execute as fast as possible.

Thread.Priority := 10
; Sets the thread priority to the maximum level (10) to further ensure the script runs smoothly.

; Functions for Komorebi Commands
;--------------------------------
; Komorebic(cmd)
; A function that runs `komorebic.exe` with the given command string (`cmd`). The command is passed
; to the external Komorebi process, which handles window management. `RunWait` ensures the script
; waits for the command to finish executing before continuing.
Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

; KomorebiRestart
; A function to restart the `komorebic.exe` process. It first stops the process, restoring all hidden
; windows, and then starts it again. The `Hide` option runs the command in the background without showing
; any console windows.
KomorebiRestart() {
    RunWait("komorebic.exe stop --bar; komorebic.exe start --bar", , "Hide")
}

; Key Definitions
;----------------
; The following variables define common modifier keys used throughout the script.
; These keys are combined into new variables such as "Hyper" and "Modifier" for ease of use.

Ctrl := "^"     ; Control key
Alt := "!"      ; Alt key
Shift := "+"    ; Shift key
Winkey := "#"   ; Windows key

; Meh and Hyper keys
Meh := Ctrl Alt Shift
; "Meh" is a combination of Ctrl, Alt, and Shift keys, used for advanced key combinations.
Hyper := Meh Winkey
; "Hyper" is the combination of "Meh" and the Windows key, allowing for more complex hotkey combinations.

Modifier := Hyper
; The default modifier used for most of the hotkeys in the script is set to the "Hyper" key.

; Actions
;--------
; These commands handle window actions like closing, minimizing, and managing Komorebi processes.
; The script binds hotkeys to each action to facilitate quick window control.

; close       - Closes the currently focused window.
; minimize    - Minimizes the currently focused window.
; toggle-pause- Toggles window tiling for the current workspace.
; stop        - Stops the `komorebic.exe` process and restores hidden windows.
; manage      - Forces Komorebi to manage the currently focused window.
; unmanage    - Stops Komorebi from managing a previously managed window.

; Example Hotkeys:
Hotkey(Modifier "q", (_) => Komorebic("close"))        
Hotkey(Modifier "m", (_) => Komorebic("minimize"))     
Hotkey(Modifier "F23", (_) => Komorebic("toggle-pause")) 
Hotkey(Modifier "F24", (_) => Komorebic("stop --bar")) 
Hotkey(Modifier "a", (_) => Komorebic("manage"))       

; Resize Windows
;---------------
; These commands manage window resizing. You can quickly save or load a layout, resize windows in specific
; directions, or set the resize delta (the step size for resizing operations).

; quick-save-resize  - Save the current window layout dimensions to memory.
; quick-load-resize  - Load the previously saved window layout dimensions from memory.
; save-resize        - Save the current window layout dimensions to a file.
; load-resize        - Load window layout dimensions from a file.
; resize-edge        - Resize the focused window along a specific edge (e.g., up, down, left, right).
; resize-axis        - Resize the window along a specific axis (horizontal/vertical).
; resize-delta       - Set the resize delta (step size) used by `resize-edge` and `resize-axis`.

; Example Hotkeys for Resizing:
Hotkey(Modifier "=", (_) => Komorebic("resize-axis horizontal increase"))
Hotkey(Modifier "-", (_) => Komorebic("resize-axis horizontal decrease"))

; Manipulate Windows
;-------------------
; These commands allow manipulation of window states, such as floating or switching to a monocle layout.
; A floating window can be moved and resized freely, whereas the monocle layout maximizes a single window.

; toggle-window-container-behaviour - Toggle the behaviour for new windows (stacking or dynamic tiling)
; toggle-tiling                     - Toggle window tiling on the focused workspace
; toggle-float                      - Toggle floating mode for the focused window
; toggle-monocle                    - Toggle monocle mode for the focused container
; toggle-maximize                   - Toggle native maximization for the focused window

; Example Hotkeys for Window Manipulation:
Hotkey(Modifier "f", (_) => Komorebic("toggle-float"))
Hotkey(Modifier "z", (_) => Komorebic("toggle-monocle"))
Hotkey(Modifier "b", (_) => Komorebic("toggle-maximize"))
Hotkey(Modifier "v", (_) => Komorebic("toggle-tiling"))

; Layouts
;--------
; These commands allow you to change or cycle through window layouts within a workspace.
; Komorebi supports multiple tiling layouts, and you can switch between them using hotkeys.

; change-layout                      - Set the layout on the focused workspace
; cycle-layout                       - Cycle between available layouts
; load-custom-layout                 - Load a custom layout from file for the focused workspace
; flip-layout                        - Flip the layout on the focused workspace (BSP only)
; workspace-layout                   - Set the layout for the specified workspace
; named-workspace-layout             - Set the layout for the specified workspace
; workspace-custom-layout            - Set a custom layout for the specified workspace
; named-workspace-custom-layout      - Set a custom layout for the specified workspace
; workspace-layout-rule              - Add a dynamic layout rule for the specified workspace
; named-workspace-layout-rule        - Add a dynamic layout rule for the specified workspace
; workspace-custom-layout-rule       - Add a dynamic custom layout for the specified workspace
; named-workspace-custom-layout-rule - Add a dynamic custom layout for the specified workspace
; clear-workspace-layout-rules       - Clear all dynamic layout rules for the specified workspace
; clear-named-workspace-layout-rules - Clear all dynamic layout rules for the specified workspace

; Example Hotkey for Layouts:
Hotkey(Modifier "x", (_) => Komorebic("flip-layout horizontal"))
Hotkey(Modifier "y", (_) => Komorebic("flip-layout vertical"))
Hotkey(Modifier "]", (_) => Komorebic("cycle-layout next"))
Hotkey(Modifier "[", (_) => Komorebic("cycle-layout previous"))

; Focus windows
; -------------------
; There commands allow you to change the focused window.

; focus                                - Change focus to the window in the specified direction
; move                                 - Move the focused window in the specified direction
; minimize                             - Minimize the focused window
; close                                - Close the focused window
; force-focus                          - Forcibly focus the window at the cursor with a left mouse click
; cycle-focus                          - Change focus to the window in the specified cycle direction
; cycle-move                           - Move the focused window in the specified cycle direction
; stack                                - Stack the focused window in the specified direction
; unstack                              - Unstack the focused window
; cycle-stack                          - Cycle the focused stack in the specified cycle direction
; focus-stack-window                   - Focus the specified window index in the focused stack
; stack-all                            - Stack all windows on the focused workspace
; unstack-all                          - Unstack all windows in the focused container
; resize-edge                          - Resize the focused window in the specified direction
; resize-axis                          - Resize the focused window or primary column along the specified axis
; move-to-monitor                      - Move the focused window to the specified monitor
; cycle-move-to-monitor                - Move the focused window to the monitor in the given cycle direction
; move-to-workspace                    - Move the focused window to the specified workspace
; move-to-named-workspace              - Move the focused window to the specified workspace
; cycle-move-to-workspace              - Move the focused window to the workspace in the given cycle direction
; send-to-monitor                      - Send the focused window to the specified monitor
; cycle-send-to-monitor                - Send the focused window to the monitor in the given cycle direction
; send-to-workspace                    - Send the focused window to the specified workspace
; send-to-named-workspace              - Send the focused window to the specified workspace
; cycle-send-to-workspace              - Send the focused window to the workspace in the given cycle direction
; send-to-monitor-workspace            - Send the focused window to the specified monitor workspace
; move-to-monitor-workspace            - Move the focused window to the specified monitor workspace
; focus-monitor                        - Focus the specified monitor
; focus-last-workspace                 - Focus the last focused workspace on the focused monitor
; focus-workspace                      - Focus the specified workspace on the focused monitor
; focus-workspaces                     - Focus the specified workspace on all monitors
; focus-monitor-workspace              - Focus the specified workspace on the target monitor
; focus-named-workspace                - Focus the specified workspace
; cycle-monitor                        - Focus the monitor in the given cycle direction
; cycle-workspace                      - Focus the workspace in the given cycle direction
; move-workspace-to-monitor            - Move the focused workspace to the specified monitor
; cycle-move-workspace-to-monitor      - Move the focused workspace monitor in the given cycle direction
; swap-workspaces-with-monitor         - Swap focused monitor workspaces with specified monitor
; new-workspace                        - Create and append a new workspace on the focused monitor
; focused-workspace-container-padding  - Set container padding on the focused workspace
; focused-workspace-padding            - Set workspace padding on the focused workspace
; adjust-container-padding             - Adjust container padding on the focused workspace
; adjust-workspace-padding             - Adjust workspace padding on the focused workspace
; change-layout                        - Set the layout on the focused workspace
; load-custom-layout                   - Load a custom layout from file for the focused workspace
; flip-layout                          - Flip the layout on the focused workspace (BSP only)
; promote                              - Promote the focused window to the top of the tree
; promote-focus                        - Promote the user focus to the top of the tree
; toggle-pause                         - Toggle window tiling on the focused workspace
; toggle-tiling                        - Toggle window tiling on the focused workspace
; toggle-float                         - Toggle floating mode for the focused window
; toggle-monocle                       - Toggle monocle mode for the focused container
; toggle-maximize                      - Toggle native maximization for the focused window
; manage                               - Force komorebi to manage the focused window
; unmanaged-window-operation-behaviour - Set the operation behaviour when the focused window is not managed
; transparency                         - Enable or disable transparency for unfocused windows
; transparency-alpha                   - Set the alpha value for unfocused window transparency
; toggle-transparency                  - Toggle transparency for unfocused windows
; focus-follows-mouse                  - Enable or disable focus follows mouse for the operating system
; toggle-focus-follows-mouse           - Toggle focus follows mouse for the operating system
; mouse-follows-focus                  - Enable or disable mouse follows focus on all workspaces
; toggle-mouse-follows-focus           - Toggle mouse follows focus on all workspaces

Hotkey(Modifier "h", (_) => Komorebic("focus left"))
Hotkey(Modifier "j", (_) => Komorebic("focus down"))
Hotkey(Modifier "k", (_) => Komorebic("focus up"))
Hotkey(Modifier "l", (_) => Komorebic("focus right"))
Hotkey(Modifier "p", (_) => Komorebic("cycle-focus previous"))
Hotkey(Modifier "n", (_) => Komorebic("cycle-focus next"))

; Move windows
; -------------------
; There commands allow you to move the window, it moves the window keeping the focus to the window.

; move                                - Move the focused window in the specified direction
; cycle-move                          - Move the focused window in the specified cycle direction
; move-to-monitor                     - Move the focused window to the specified monitor
; cycle-move-to-monitor               - Move the focused window to the monitor in the given cycle direction
; move-to-workspace                   - Move the focused window to the specified workspace
; move-to-named-workspace             - Move the focused window to the specified workspace
; cycle-move-to-workspace             - Move the focused window to the workspace in the given cycle direction
; move-to-monitor-workspace           - Move the focused window to the specified monitor workspace
; move-workspace-to-monitor           - Move the focused workspace to the specified monitor
; cycle-move-workspace-to-monitor     - Move the focused workspace monitor in the given cycle direction
; cross-monitor-move-behaviour        - Set the behaviour when moving windows across monitor boundaries
; toggle-cross-monitor-move-behaviour - Toggle the behaviour when moving windows across monitor boundaries

    Hotkey(Modifier ";", (_) => Komorebic("cycle-move next"))
    Hotkey(Modifier ",", (_) => Komorebic("cycle-move previous"))

; Stack windows
    ; stack                                      Stack the focused window in the specified direction
    ; unstack                                    Unstack the focused window
    ; cycle-stack                                Cycle the focused stack in the specified cycle direction
    ; focus-stack-window                         Focus the specified window index in the focused stack
    ; stack-all                                  Stack all windows on the focused workspace
    ; unstack-all                                Unstack all windows in the focused container
    ; toggle-window-container-behaviour          Toggle the behaviour for new windows (stacking or dynamic tiling)

    ; Hotkey(Modifier "Left", (_) => Komorebic("stack left"))
    ; Hotkey(Modifier "Down", (_) => Komorebic("stack down"))
    ; Hotkey(Modifier "Up", (_) => Komorebic("stack up"))
    ; Hotkey(Modifier "Right", (_) => Komorebic("stack right"))


; Workspaces
    ; stack-all                                  Stack all windows on the focused workspace
    ; move-to-workspace                          Move the focused window to the specified workspace
    ; move-to-named-workspace                    Move the focused window to the specified workspace
    ; cycle-move-to-workspace                    Move the focused window to the workspace in the given cycle direction
    ; send-to-workspace                          Send the focused window to the specified workspace
    ; send-to-named-workspace                    Send the focused window to the specified workspace
    ; cycle-send-to-workspace                    Send the focused window to the workspace in the given cycle direction
    ; send-to-monitor-workspace                  Send the focused window to the specified monitor workspace
    ; move-to-monitor-workspace                  Move the focused window to the specified monitor workspace
    ; focus-last-workspace                       Focus the last focused workspace on the focused monitor
    ; focus-workspace                            Focus the specified workspace on the focused monitor
    ; focus-workspaces                           Focus the specified workspace on all monitors
    ; focus-monitor-workspace                    Focus the specified workspace on the target monitor
    ; focus-named-workspace                      Focus the specified workspace
    ; cycle-workspace                            Focus the workspace in the given cycle direction
    ; move-workspace-to-monitor                  Move the focused workspace to the specified monitor
    ; cycle-move-workspace-to-monitor            Move the focused workspace monitor in the given cycle direction
    ; swap-workspaces-with-monitor               Swap focused monitor workspaces with specified monitor
    ; new-workspace                              Create and append a new workspace on the focused monitor
    ; focused-workspace-container-padding        Set container padding on the focused workspace
    ; focused-workspace-padding                  Set workspace padding on the focused workspace
    ; adjust-container-padding                   Adjust container padding on the focused workspace
    ; adjust-workspace-padding                   Adjust workspace padding on the focused workspace
    ; change-layout                              Set the layout on the focused workspace
    ; load-custom-layout                         Load a custom layout from file for the focused workspace
    ; flip-layout                                Flip the layout on the focused workspace (BSP only)
    ; ensure-workspaces                          Create at least this many workspaces for the specified monitor
    ; ensure-named-workspaces                    Create these many named workspaces for the specified monitor
    ; container-padding                          Set the container padding for the specified workspace
    ; named-workspace-container-padding          Set the container padding for the specified workspace
    ; workspace-padding                          Set the workspace padding for the specified workspace
    ; named-workspace-padding                    Set the workspace padding for the specified workspace
    ; workspace-layout                           Set the layout for the specified workspace
    ; named-workspace-layout                     Set the layout for the specified workspace
    ; workspace-custom-layout                    Set a custom layout for the specified workspace
    ; named-workspace-custom-layout              Set a custom layout for the specified workspace
    ; workspace-layout-rule                      Add a dynamic layout rule for the specified workspace
    ; named-workspace-layout-rule                Add a dynamic layout rule for the specified workspace
    ; workspace-custom-layout-rule               Add a dynamic custom layout for the specified workspace
    ; named-workspace-custom-layout-rule         Add a dynamic custom layout for the specified workspace
    ; clear-workspace-layout-rules               Clear all dynamic layout rules for the specified workspace
    ; clear-named-workspace-layout-rules         Clear all dynamic layout rules for the specified workspace
    ; workspace-tiling                           Enable or disable window tiling for the specified workspace
    ; named-workspace-tiling                     Enable or disable window tiling for the specified workspace
    ; workspace-name                             Set the workspace name for the specified workspace
    ; toggle-pause                               Toggle window tiling on the focused workspace
    ; toggle-tiling                              Toggle window tiling on the focused workspace
    ; window-hiding-behaviour                    Set the window behaviour when switching workspaces / cycling stacks
    ; initial-workspace-rule                     Add a rule to associate an application with a workspace on first show
    ; initial-named-workspace-rule               Add a rule to associate an application with a named workspace on first show
    ; workspace-rule                             Add a rule to associate an application with a workspace
    ; named-workspace-rule                       Add a rule to associate an application with a named workspace
    ; clear-workspace-rules                      Remove all application association rules for a workspace by monitor and workspace index
    ; clear-named-workspace-rules                Remove all application association rules for a named workspace
    ; clear-all-workspace-rules                  Remove all application association rules for all workspaces
    ; mouse-follows-focus                        Enable or disable mouse follows focus on all workspaces
    ; toggle-mouse-follows-focus                 Toggle mouse follows focus on all workspaces
    Hotkey(Modifier "w", (_) => Komorebic("focus-workspace 0"))
    Hotkey(Modifier "e", (_) => Komorebic("focus-workspace 1"))
    Hotkey(Modifier "r", (_) => Komorebic("focus-workspace 2"))
    Hotkey(Modifier "t", (_) => Komorebic("focus-workspace 4"))

    Hotkey(Modifier "6", (_) => Komorebic("cycle-move-to-workspace next"))

    Hotkey(Modifier "2", (_) => Komorebic("send-to-workspace 0"))
    Hotkey(Modifier "3", (_) => Komorebic("send-to-workspace 1"))
    Hotkey(Modifier "4", (_) => Komorebic("send-to-workspace 2"))
    Hotkey(Modifier "5", (_) => Komorebic("send-to-workspace 3"))


; Monitors (Não consigo testar aqui)
    ; monitor-information                        Show information about connected monitors
    ; move-to-monitor                            Move the focused window to the specified monitor
    ; cycle-move-to-monitor                      Move the focused window to the monitor in the given cycle direction
    ; send-to-monitor                            Send the focused window to the specified monitor
    ; cycle-send-to-monitor                      Send the focused window to the monitor in the given cycle direction
    ; send-to-monitor-workspace                  Send the focused window to the specified monitor workspace
    ; move-to-monitor-workspace                  Move the focused window to the specified monitor workspace
    ; focus-monitor                              Focus the specified monitor
    ; focus-last-workspace                       Focus the last focused workspace on the focused monitor
    ; focus-workspace                            Focus the specified workspace on the focused monitor
    ; focus-workspaces                           Focus the specified workspace on all monitors
    ; focus-monitor-workspace                    Focus the specified workspace on the target monitor
    ; cycle-monitor                              Focus the monitor in the given cycle direction
    ; move-workspace-to-monitor                  Move the focused workspace to the specified monitor
    ; cycle-move-workspace-to-monitor            Move the focused workspace monitor in the given cycle direction
    ; swap-workspaces-with-monitor               Swap focused monitor workspaces with specified monitor
    ; new-workspace                              Create and append a new workspace on the focused monitor
    ; monitor-work-area-offset                   Set offsets for a monitor to exclude parts of the work area from tiling
    ; monitor-index-preference                   Set the monitor index preference for a monitor identified using its size
    ; display-index-preference                   Set the display index preference for a monitor identified using its display name
    ; ensure-workspaces                          Create at least this many workspaces for the specified monitor
    ; ensure-named-workspaces                    Create these many named workspaces for the specified monitor
    ; cross-monitor-move-behaviour               Set the behaviour when moving windows across monitor boundaries
    ; toggle-cross-monitor-move-behaviour        Toggle the behaviour when moving windows across monitor boundaries

    Hotkey(Modifier "7", (_) => Komorebic("cycle-move-to-monitor next"))

; quickstart                                 Gather example configurations for a new-user quickstart
; start                                      Start komorebi.exe as a background process
; stop                                       Stop the komorebi.exe process and restore all hidden windows
; check                                      Check komorebi configuration and related files for common errors
; configuration                              Show the path to komorebi.json
; bar-configuration                          Show the path to komorebi.bar.json
; whkdrc                                     Show the path to whkdrc
; state                                      Show a JSON representation of the current window manager state
; global-state                               Show a JSON representation of the current global state
; gui                                        Launch the komorebi-gui debugging tool
; visible-windows                            Show a JSON representation of visible windows
; monitor-information                        Show information about connected monitors
; query                                      Query the current window manager state
; subscribe-socket                           Subscribe to komorebi events using a Unix Domain Socket
; unsubscribe-socket                         Unsubscribe from komorebi events
; subscribe-pipe                             Subscribe to komorebi events using a Named Pipe
; unsubscribe-pipe                           Unsubscribe from komorebi events
; log                                        Tail komorebi.exe's process logs (cancel with Ctrl-C)
; quick-save-resize                          Quicksave the current resize layout dimensions
; quick-load-resize                          Load the last quicksaved resize layout dimensions
; save-resize                                Save the current resize layout dimensions to a file
; load-resize                                Load the resize layout dimensions from a file
; focus                                      Change focus to the window in the specified direction
; move                                       Move the focused window in the specified direction
; minimize                                   Minimize the focused window
; close                                      Close the focused window
; force-focus                                Forcibly focus the window at the cursor with a left mouse click
; cycle-focus                                Change focus to the window in the specified cycle direction
; cycle-move                                 Move the focused window in the specified cycle direction
; stack                                      Stack the focused window in the specified direction
; unstack                                    Unstack the focused window
; cycle-stack                                Cycle the focused stack in the specified cycle direction
; focus-stack-window                         Focus the specified window index in the focused stack
; stack-all                                  Stack all windows on the focused workspace
; unstack-all                                Unstack all windows in the focused container
; resize-edge                                Resize the focused window in the specified direction
; resize-axis                                Resize the focused window or primary column along the specified axis
; move-to-monitor                            Move the focused window to the specified monitor
; cycle-move-to-monitor                      Move the focused window to the monitor in the given cycle direction
; move-to-workspace                          Move the focused window to the specified workspace
; move-to-named-workspace                    Move the focused window to the specified workspace
; cycle-move-to-workspace                    Move the focused window to the workspace in the given cycle direction
; send-to-monitor                            Send the focused window to the specified monitor
; cycle-send-to-monitor                      Send the focused window to the monitor in the given cycle direction
; send-to-workspace                          Send the focused window to the specified workspace
; send-to-named-workspace                    Send the focused window to the specified workspace
; cycle-send-to-workspace                    Send the focused window to the workspace in the given cycle direction
; send-to-monitor-workspace                  Send the focused window to the specified monitor workspace
; move-to-monitor-workspace                  Move the focused window to the specified monitor workspace
; focus-monitor                              Focus the specified monitor
; focus-last-workspace                       Focus the last focused workspace on the focused monitor
; focus-workspace                            Focus the specified workspace on the focused monitor
; focus-workspaces                           Focus the specified workspace on all monitors
; focus-monitor-workspace                    Focus the specified workspace on the target monitor
; focus-named-workspace                      Focus the specified workspace
; cycle-monitor                              Focus the monitor in the given cycle direction
; cycle-workspace                            Focus the workspace in the given cycle direction
; move-workspace-to-monitor                  Move the focused workspace to the specified monitor
; cycle-move-workspace-to-monitor            Move the focused workspace monitor in the given cycle direction
; swap-workspaces-with-monitor               Swap focused monitor workspaces with specified monitor
; new-workspace                              Create and append a new workspace on the focused monitor
; resize-delta                               Set the resize delta (used by resize-edge and resize-axis)
; invisible-borders                          Set the invisible border dimensions around each window
; global-work-area-offset                    Set offsets to exclude parts of the work area from tiling
; monitor-work-area-offset                   Set offsets for a monitor to exclude parts of the work area from tiling
; focused-workspace-container-padding        Set container padding on the focused workspace
; focused-workspace-padding                  Set workspace padding on the focused workspace
; adjust-container-padding                   Adjust container padding on the focused workspace
; adjust-workspace-padding                   Adjust workspace padding on the focused workspace
; change-layout                              Set the layout on the focused workspace
; cycle-layout                               Cycle between available layouts
; load-custom-layout                         Load a custom layout from file for the focused workspace
; flip-layout                                Flip the layout on the focused workspace (BSP only)
; promote                                    Promote the focused window to the top of the tree
; promote-focus                              Promote the user focus to the top of the tree
; promote-window                             Promote the window in the specified direction
; retile                                     Force the retiling of all managed windows
; monitor-index-preference                   Set the monitor index preference for a monitor identified using its size
; display-index-preference                   Set the display index preference for a monitor identified using its display name
; ensure-workspaces                          Create at least this many workspaces for the specified monitor
; ensure-named-workspaces                    Create these many named workspaces for the specified monitor
; container-padding                          Set the container padding for the specified workspace
; named-workspace-container-padding          Set the container padding for the specified workspace
; workspace-padding                          Set the workspace padding for the specified workspace
; named-workspace-padding                    Set the workspace padding for the specified workspace
; workspace-layout                           Set the layout for the specified workspace
; named-workspace-layout                     Set the layout for the specified workspace
; workspace-custom-layout                    Set a custom layout for the specified workspace
; named-workspace-custom-layout              Set a custom layout for the specified workspace
; workspace-layout-rule                      Add a dynamic layout rule for the specified workspace
; named-workspace-layout-rule                Add a dynamic layout rule for the specified workspace
; workspace-custom-layout-rule               Add a dynamic custom layout for the specified workspace
; named-workspace-custom-layout-rule         Add a dynamic custom layout for the specified workspace
; clear-workspace-layout-rules               Clear all dynamic layout rules for the specified workspace
; clear-named-workspace-layout-rules         Clear all dynamic layout rules for the specified workspace
; workspace-tiling                           Enable or disable window tiling for the specified workspace
; named-workspace-tiling                     Enable or disable window tiling for the specified workspace
; workspace-name                             Set the workspace name for the specified workspace
; toggle-window-container-behaviour          Toggle the behaviour for new windows (stacking or dynamic tiling)
; toggle-pause                               Toggle window tiling on the focused workspace
; toggle-tiling                              Toggle window tiling on the focused workspace
; toggle-float                               Toggle floating mode for the focused window
; toggle-monocle                             Toggle monocle mode for the focused container
; toggle-maximize                            Toggle native maximization for the focused window
; restore-windows                            Restore all hidden windows (debugging command)
; manage                                     Force komorebi to manage the focused window
; unmanage                                   Unmanage a window that was forcibly managed
; replace-configuration                      Replace the configuration of a running instance of komorebi from a static configuration file
; reload-configuration                       Reload legacy komorebi.ahk or komorebi.ps1 configurations (if they exist)
; watch-configuration                        Enable or disable watching of legacy komorebi.ahk or komorebi.ps1 configurations (if they exist)
; complete-configuration                     For legacy komorebi.ahk or komorebi.ps1 configurations, signal that the final configuration option has been sent
; window-hiding-behaviour                    Set the window behaviour when switching workspaces / cycling stacks
; cross-monitor-move-behaviour               Set the behaviour when moving windows across monitor boundaries
; toggle-cross-monitor-move-behaviour        Toggle the behaviour when moving windows across monitor boundaries
; unmanaged-window-operation-behaviour       Set the operation behaviour when the focused window is not managed
; float-rule                                 Add a rule to always float the specified application
; manage-rule                                Add a rule to always manage the specified application
; initial-workspace-rule                     Add a rule to associate an application with a workspace on first show
; initial-named-workspace-rule               Add a rule to associate an application with a named workspace on first show
; workspace-rule                             Add a rule to associate an application with a workspace
; named-workspace-rule                       Add a rule to associate an application with a named workspace
; clear-workspace-rules                      Remove all application association rules for a workspace by monitor and workspace index
; clear-named-workspace-rules                Remove all application association rules for a named workspace
; clear-all-workspace-rules                  Remove all application association rules for all workspaces
; identify-object-name-change-application    Identify an application that sends EVENT_OBJECT_NAMECHANGE on launch
; identify-tray-application                  Identify an application that closes to the system tray
; identify-layered-application               Identify an application that has WS_EX_LAYERED, but should still be managed
; remove-title-bar                           Whitelist an application for title bar removal
; toggle-title-bars                          Toggle title bars for whitelisted applications
; border                                     Enable or disable borders
; border-colour                              Set the colour for a window border kind
; border-width                               Set the border width
; border-offset                              Set the border offset
; border-style                               Set the border style
; border-implementation                      Set the border implementation
; transparency                               Enable or disable transparency for unfocused windows
; transparency-alpha                         Set the alpha value for unfocused window transparency
; toggle-transparency                        Toggle transparency for unfocused windows
; animation                                  Enable or disable movement animations
; animation-duration                         Set the duration for movement animations in ms
; animation-fps                              Set the frames per second for movement animations
; animation-style                            Set the ease function for movement animations
; focus-follows-mouse                        Enable or disable focus follows mouse for the operating system
; toggle-focus-follows-mouse                 Toggle focus follows mouse for the operating system
; mouse-follows-focus                        Enable or disable mouse follows focus on all workspaces
; toggle-mouse-follows-focus                 Toggle mouse follows focus on all workspaces
; ahk-app-specific-configuration             Generate common app-specific configurations and fixes to use in komorebi.ahk
; pwsh-app-specific-configuration            Generate common app-specific configurations and fixes in a PowerShell script
; format-app-specific-configuration          Format a YAML file for use with the 'ahk-app-specific-configuration' command
; fetch-app-specific-configuration           Fetch the latest version of applications.yaml from komorebi-application-specific-configuration
; application-specific-configuration-schema  Generate a JSON Schema for applications.yaml
; notification-schema                        Generate a JSON Schema of subscription notifications
; socket-schema                              Generate a JSON Schema of socket messages
; static-config-schema                       Generate a JSON Schema of the static configuration file
; generate-static-config                     Generates a static configuration JSON file based on the current window manager state
; enable-autostart                           Generates the komorebi.lnk shortcut in shell:startup to autostart komorebi
; disable-autostart                          Deletes the komorebi.lnk shortcut in shell:startup to disable autostart
; help                                       Print this message or the help of the given subcommand(s)

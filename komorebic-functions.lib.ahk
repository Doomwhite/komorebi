#SingleInstance Force
SetTitleMatchMode(2)
SetKeyDelay(-1)

komorebic_start() 
{
    RunWait("komorebic.exe start --await-configuration", , "Hide")
    yasb_start()

    ; Includes the applications configurations
    ; https://github.com/LGUG2Z/komorebi/#generating-common-application-specific-configurations
    #Include A_ScriptDir "\komorebi.generated.ahk"

    ; Removes the container paddings from monitor 0
    RunWait("komorebic.exe container-padding 0 0 0", , "Hide")
    RunWait("komorebic.exe container-padding 0 1 0", , "Hide")
    RunWait("komorebic.exe container-padding 0 2 0", , "Hide")
    RunWait("komorebic.exe container-padding 0 3 0", , "Hide")
    RunWait("komorebic.exe container-padding 0 4 0", , "Hide")

    ; Removes the container paddings from monitor 1
    RunWait("komorebic.exe container-padding 1 0 0", , "Hide")
    RunWait("komorebic.exe container-padding 1 1 0", , "Hide")
    RunWait("komorebic.exe container-padding 1 2 0", , "Hide")
    RunWait("komorebic.exe container-padding 1 3 0", , "Hide")
    RunWait("komorebic.exe container-padding 1 4 0", , "Hide")

    ; Removes the workspace paddings from monitor 1
    RunWait("komorebic.exe workspace-padding 0 0 0", , "Hide")
    RunWait("komorebic.exe workspace-padding 0 1 0", , "Hide")
    RunWait("komorebic.exe workspace-padding 0 2 0", , "Hide")
    RunWait("komorebic.exe workspace-padding 0 3 0", , "Hide")
    RunWait("komorebic.exe workspace-padding 0 4 0", , "Hide")

    ; Removes the workspace paddings from monitor 1
    RunWait("komorebic.exe workspace-padding 1 0 0", , "Hide")
    RunWait("komorebic.exe workspace-padding 1 1 0", , "Hide")
    RunWait("komorebic.exe workspace-padding 1 2 0", , "Hide")
    RunWait("komorebic.exe workspace-padding 1 3 0", , "Hide")
    RunWait("komorebic.exe workspace-padding 1 4 0", , "Hide")

    ; window hiding behavior
    ;RunWait, komorebic.exe window-hiding-behaviour hide, , Hide

    ; Enable hot reloading of changes to this file
    RunWait("komorebic.exe watch-configuration enable", , "Hide")

    ; Open Yasb
    ; RunWait, python C:\Users\adinelson.bruhmuller.MOVTECH\.yasb\app\src\main.py, , Hide

    ; Configure the invisible border dimensions
    RunWait("komorebic.exe invisible-borders 0 0 0 0", , "Hide")
    RunWait("komorebic.exe invisible-borders 1 0 0 0", , "Hide")

    ; Visual border drawn around the focused window
    RunWait("komorebic.exe active-window-border enable", , "Hide")
    RunWait("komorebic.exe active-window-border-colour 66 165 245", , "Hide")

    ; Enable focus follows mouse
    RunWait("komorebic.exe focus-follows-mouse disable", , "Hide")
    RunWait("komorebic.exe mouse-follows-focus enable", , "Hide")

    ; Ensure there are workspaces created on the monitors
    RunWait("komorebic.exe ensure-workspaces 0 5", , "Hide")
    RunWait("komorebic.exe ensure-workspaces 1 5", , "Hide")

    ; Give the workspaces some optional names
    RunWait("komorebic.exe workspace-name 1 0 chrome", , "Hide")
    RunWait("komorebic.exe workspace-name 1 1 app", , "Hide")
    RunWait("komorebic.exe workspace-name 1 2 api", , "Hide")
    ; RunWait, komorebic.exe workspace-name 1 3 matrix, , Hide
    ; RunWait, komorebic.exe workspace-name 1 4 floaty, , Hide

    ; Set the padding of the different workspaces
    ; RunWait, komorebic.exe workspace-padding 0 1 30, , Hide
    ; RunWait, komorebic.exe container-padding 0 1 30, , Hide
    ; RunWait, komorebic.exe workspace-padding 0 2 30, , Hide
    ; RunWait, komorebic.exe container-padding 0 2 30, , Hide
    ; RunWait, komorebic.exe workspace-padding 0 3 30, , Hide
    ; RunWait, komorebic.exe container-padding 0 3 30, , Hide

    ; Set the layouts of different workspaces
    ; RunWait, komorebic.exe workspace-layout 0 1 columns, , Hide

    ; Set the floaty layout to not tile any windows
    ; RunWait, komorebic.exe workspace-tiling 0 4 disable, , Hide

    ; Organizes apps on the their workspace
    RunWait("komorebic.exe workspace-rule exe `"chrome.exe`" 1 0", , "Hide")
    RunWait("komorebic.exe workspace-rule exe Code.exe 1 1", , "Hide")
    RunWait("komorebic.exe workspace-rule exe devenv.exe 1 2", , "Hide")
    ; RunWait, komorebic.exe workspace-rule exe Discord.exe 1 2, , Hide
    ; RunWait, komorebic.exe workspace-rule exe Spotify.exe 1 2, , Hide

    ; Identify applications that have overflowing borders
    RunWait("komorebic.exe identify-border-overflow exe Discord.exe", , "Hide")

    RunWait("komorebic.exe complete-configuration", , "Hide")
}

komorebic_stop()
{
    RunWait("komorebic.exe stop", , "Hide")
    RunWait("taskkill.exe /f /im komorebic.exe", , "Hide")
    yasb_stop()
    return
}

yasb_start()
{
    RunWait("pythonw C:\Users\adinelson.bruhmuller.MOVTECH\.yasb\app\src\main.py", , "Hide")
    RunWait("komorebic.exe work-area-offset 0 28 0 28", , "Hide")
}

yasb_stop()
{
    RunWait("taskkill.exe /f /im pythonw.exe", , "Hide")
    RunWait("komorebic.exe work-area-offset 0 0 0 0", , "Hide")
}
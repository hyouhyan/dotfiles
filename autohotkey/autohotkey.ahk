SetTitleMatchMode, RegEx

; Scrapbox用
^#!o::
    ; Cosense PWA のウィンドウが存在するか
    if WinExist("^Cosense ahk_class Chrome_WidgetWin_1")
    {
        ; 既にアクティブなら閉じる
        if WinActive("^Cosense ahk_class Chrome_WidgetWin_1")
        {
            WinClose
        }
        else
        {
            WinActivate
        }
    }
    else
    {
        Run, "C:\Users\Hyouhyan\AppData\Local\Vivaldi\Application\vivaldi_proxy.exe"  --profile-directory=Default --app-id=ngboffpgmgciiinnflnkgedmbalfkeeg
    }
    return

; WezTerm用
^#!t::
    ApplicationBinaryName=wezterm-gui.exe
    ApplicationBinaryPath="C:\Program Files\WezTerm\wezterm-gui.exe"

    Process, Exist, %ApplicationBinaryName%
    if ErrorLevel=0
    {
        Run, %ApplicationBinaryPath%, %A_WorkingDir%
        WinWait, ahk_exe %ApplicationBinaryName%
        WinActivate, ahk_exe %ApplicationBinaryName%
        Exit
    }

    WinGet, WinState, MinMax, ahk_exe %ApplicationBinaryName%
    if WinState=-1
    {
        WinActivate, ahk_exe %ApplicationBinaryName%
    }
    else
    {
        WinMinimize, ahk_exe %ApplicationBinaryName%
    }
    return

SetTitleMatchMode, RegEx

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

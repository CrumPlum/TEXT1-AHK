SetCapsLockState AlwaysOff



; Basic movement
CapsLock & f::Send {blind}{Left}
CapsLock & g::Send {blind}{Right}
CapsLock & r::Send {blind}{Up}
CapsLock & v::Send {blind}{Down}

; Fast move
CapsLock & u::Send {blind}{Up 5}
CapsLock & n::Send {blind}{Down 5}

; CapsLock shortcuts
CapsLock & s::SendInput, #+s
CapsLock & l::SendInput, sviraka@gmail.com
CapsLock & vk4B::
FormatTime, currentDateTime,, yyyy.MM.dd HH:mm
SendInput, %currentDateTime%
return
CapsLock & w::WinMinimize, A

; Edit the current line
CapsLock & q::SendInput, +{Home}{Backspace}
CapsLock & e::SendInput, +{End}{Backspace}
CapsLock & a::SendInput, {Home}+{End}
CapsLock & d::SendInput, {Home}+{End}{Delete}

; Search selected text in Google using the default browser
CapsLock & c::
savedClipboard := ClipboardAll
Clipboard :=
SendInput, ^c
ClipWait, 0.5
if (!ErrorLevel && Clipboard != "")
    Run, % "https://www.google.com/search?q=" . UriEncode(Clipboard)
Clipboard := savedClipboard
savedClipboard := ""
return

; Open Obsidian
CapsLock & o::Run, "C:\Program Files\Obsidian\Obsidian.exe"

; Discord mute shortcut and system audio mute
CapsLock & p::SendInput, {RControl down}{Del}{RControl up}
CapsLock & m::SendInput, {Volume_Mute}

; Move by word
CapsLock & LAlt::SendInput, ^{Left}
CapsLock & vk20::SendInput, ^{Right}

; CapsLock + 1-0,\,<,>,/
CapsLock & vk31::SendInput {!}
CapsLock & vk32::SendInput {@}
CapsLock & vk33::SendInput {#}
CapsLock & vk34::SendInput {;}
CapsLock & vk36::SendInput {:}
CapsLock & vk37::SendInput {?}
CapsLock & vk38::SendInput {*}
CapsLock & vk39::SendInput {(}
CapsLock & vk30::SendInput {)}
CapsLock & vkBA::SendInput {:}
CapsLock & vkBC::SendInput {<}
CapsLock & vkBE::SendInput {>}
CapsLock & vkC0::SendInput {~}
CapsLock & vkBF::SendInput {/}
CapsLock & vkDC::SendInput {|}
CapsLock & vkDE::SendInput {"}


; RAlt + []
CapsLock & vkDB::SendInput {[}
CapsLock & vkDD::SendInput {]}

;рус клав
!^vk53::SendRaw ы
!^+vk53::SendRaw Ы
!^vk45::SendRaw ё
!^+vk45::SendRaw Ё
!^vkDE::SendRaw э
!^+vkDE::SendRaw Э
!^vkDD::SendRaw ъ
!^vk54::SendRaw ё
!^+vk54::SendRaw Ё
!^vk4D::SendRaw ъ

; замість дефісу тире, CapsLock + -
CapsLock & vkBD::SendInput {—}


; Win+= - выбранное вікно поверх інших
CapsLock & vkBB:: Winset, Alwaysontop, , A



UriEncode(text) {
    byteCount := StrPut(text, "UTF-8")
    VarSetCapacity(utf8, byteCount, 0)
    StrPut(text, &utf8, byteCount, "UTF-8")
    encoded := ""
    Loop, % byteCount - 1
    {
        byte := NumGet(utf8, A_Index - 1, "UChar")
        if ((byte >= 0x30 && byte <= 0x39) || (byte >= 0x41 && byte <= 0x5A) || (byte >= 0x61 && byte <= 0x7A) || byte = 0x2D || byte = 0x2E || byte = 0x5F || byte = 0x7E)
            encoded .= Chr(byte)
        else
            encoded .= "%" . Format("{:02X}", byte)
    }
    return encoded
}
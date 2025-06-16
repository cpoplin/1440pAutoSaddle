#Persistent
#SingleInstance, Force
SetMouseDelay, -1  ; Faster mouse movements (0 equivalent to pyautogui.PAUSE = 0.0)

; --- Variables ---
saddle_name := ""
search_bar_x := 345
search_bar_y := 257
first_searched_item_x := 285
first_searched_item_y := 379

; --- Initialization ---
; Get saddle name using an AHK equivalent of easygui.enterbox
InputBox, saddle_name, Auto Saddler, Enter the name of the saddle to put on close the program by typing 0 zero:,,,,,rex saddle
If ErrorLevel = 1  ; User canceled or closed the input box
{
    MsgBox, User canceled, exiting program.
    ExitApp
}

; --- Hotkeys ---

; Hotkey to exit the program (0)
0::
    MsgBox, User has pressed 0, exiting program
    ExitApp
    return

; Hotkey for 'f' functionality
~f::
    Sleep, 1000  ; 1 second delay (1000 milliseconds)
    ;ToolTip, f pressed ; For debugging, similar to print
    
    Click, %search_bar_x%, %search_bar_y%
    
    ; Copy saddle_name to clipboard
    Clipboard := saddle_name
    
    Sleep, 50  ; 0.05 second delay
    
    SendInput, ^v  ; Paste from clipboard (Ctrl+V)
    
    Click, %first_searched_item_x%, %first_searched_item_y%
    Sleep, 50
    
    SendInput, e
    SendInput, {Esc}
    return
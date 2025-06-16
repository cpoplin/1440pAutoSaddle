import pyautogui as pag
import time
import sys
import keyboard
import easygui as eg
import pyperclip

pag.PAUSE = 0.0


#Point(x=654, y=401)   - search bar location

def on_0_press():
    eg.msgbox(
        msg="User has pressed 0, exiting program",
        title="Sim Exited"
    )
    global running
    running = False
    print("exiting program, 0 pressed")
    sys.exit(0)
keyboard.add_hotkey('0', on_0_press)

def on_f_press():
    global saddle_name
    global search_bar_location
    global first_searched_item_location
    time.sleep(1)
    print("f pressed")
    pag.click(search_bar_location)
    pyperclip.copy(saddle_name)
    time.sleep(.05)
    pag.hotkey("ctrl", "v")
    pag.click(first_searched_item_location)
    pag.press("e")
    pag.press("esc")

keyboard.add_hotkey('f', on_f_press)

saddle_name = eg.enterbox(
    msg="Please enter the name of the saddle to put on, close the program by typing 0 (zero):",
    title="Auto Saddler",
    default="rex saddle" 
    )
search_bar_location = (345, 257)
first_searched_item_location = (285, 379)

running = True

while running:
    pass
-- [[ Modifier Keys ]] --
local masterModifierKeys = {"cmd","alt","ctrl"}
local windowModifierKeys = {"cmd","alt"}
local alternateWindowModifierKeys = {"cmd","ctrl"}
local bottomWindowModifierKeys = {"ctrl","alt"}
local windowSwitchModifierKeys = {"alt"}

-------------------------------------------------------------------------------------

-- [[ Attribs ]] --
hs.window.animationDuration = 0

-------------------------------------------------------------------------------------
-- [[ Functions ]] --

function reloadConfig()
    hs.reload()
end
hs.alert.show("Config Reloaded!")

-- [ Launch/Focus Apps ] --
function launchFocusKitty()
    hs.application.launchOrFocus("kitty")
end    

function launchFocusSafari()
    hs.application.launchOrFocus("Safari")
end    

function launchFocusHammerspoon()
    hs.toggleConsole()
end

-- [ Window Manip ] --
function increaseWindowSize()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    f.h = f.h + 20
    f.w = f.w + 20
    win:setFrame(f)
end

function decreaseWindowSize()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    f.h = f.h - 20
    f.w = f.w - 20

    win:setFrame(f)
end

function setFullscreenWindow()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    
    f.w = max.w - 30
    f.h = max.h - 30
    
    win:setFrame(f)
    centreWindow()

end 


-- [[ Window Switcher ]] --
function focusWinodwN()
    error = hs.window.focusWindowNorth()
    if error ~= true then hs.alert.show("Could not focus Window!") end
end   

function focusWindowE()
    error = hs.window.focusWindowEast()
    if error ~= true then hs.alert.show("Could not focus Window!") end
end    

function focusWindowW()
    error = hs.window.focusWindowWest()
    if error ~= true then hs.alert.show("Could not focus Window!") end
end

function focusWindowS()
    error = hs.window.focusWindowSouth()
    if error ~= true then hs.alert.show("Could not focus Window!") end
end    

-- [[ Quick Window Movement ]] --
function halfWindowMovementLeft()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + 20
    f.y = max.y + 10
    f.w = max.w / 2 - 45
    f.h = max.h - 20
    win:setFrame(f)
end   

function halfWindowMovementRight()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    
    f.x = max.x + (max.w/2) - 5
    f.y = max.y + 10
    f.w = max.w / 2 - 20
    f.h = max.h - 20

    win:setFrame(f)
end

function topLeftWindow()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + 20
    f.y = max.y + 10
    f.w = max.w / 2 - 45
    f.h = max.h / 2 - 20

    win:setFrame(f)

end    

function topRightWindow()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    
    f.x = max.x + (max.w/2)
    f.y = max.y + 10
    f.w = max.w / 2 - 30
    f.h = max.h / 2 - 20
    
    win:setFrame(f)
end

function bottomLeftWindow()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    
    f.x = max.x / 2 + 20
    f.y = max.y + (430) + 10
    f.w = max.w / 2 - 45 
    f.h = max.h / 2 - 20

    win:setFrame(f)
end 

function bottomRightWindow()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w/2)
    f.y = max.y + (430) + 10
    f.w = max.w / 2 - 30 
    f.h = max.h / 2 - 20

    win:setFrame(f)

end 

function centreWindow()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    
    f.x = ((max.w - f.w) / 2) + max.x
    f.y = ((max.h - f.h) / 2) + max.y
    
    win:setFrame(f)

end

-- [ Misc ] --
-- [[ Lock screen ]] --
function lockScreen()
    hs.caffeinate.startScreensaver()
end 

-- [[ Layout Setup ]] --
function devSetup()
    startSafari()
    halfWindowMovementLeft()    
    hs.application.launchOrFocus("kitty")
    halfWindowMovementRight()
    hs.alert.show("Happy Coding!")
end

-- [[ Menubar ]] --
function setWeather(location,weatherMenubar)
--    output = hs.execute("curl 'wttr.in/".. location .. "?format=%l:+%c+%t'")
 --   weatherMenubar:setTitle(output)
end    
output = hs.execute("curl 'wttr.in/Johannesburg?format=%l:+%c+%t'")
weather = hs.menubar.new()
weatherTable =  {
       { title = "Cape Town", fn = setWeather("Cape-Town",weather)},
       { title = "Dubai", fn = setWeather("Dubai",weather)}
   }

weather:setTitle(output)

-- [[ App watcher ]] --
-------------------------------------------------------------------------------------

-- [[ Hotkey Bindings ]] --

hs.hotkey.bind(masterModifierKeys,"R",reloadConfig)

-- [ Launch/Focus Apps ] --
-- Launch Kitty --
hs.hotkey.bind({"cmd","alt"},"return",launchFocusKitty)

-- Launch Safari --
hs.hotkey.bind(masterModifierKeys,"S",launchFocusSafari)

-- Launch Hammerspoon --
hs.hotkey.bind(masterModifierKeys,"O",launchFocusHammerspoon)

-- [ Window Manip ] --
-- Increase focused window size --
hs.hotkey.bind(windowModifierKeys,"I",increaseWindowSize)

-- Decrease focused window size --
hs.hotkey.bind(windowModifierKeys,"K",decreaseWindowSize)

-- Move focused window left half of the screen --
hs.hotkey.bind(windowModifierKeys,"Left",halfWindowMovementLeft)

-- Move focused window to the right half of the screen --
hs.hotkey.bind(windowModifierKeys,"Right",halfWindowMovementRight)

-- Move focused window to the centre of the screen --
hs.hotkey.bind(windowModifierKeys,"C",centreWindow)

-- Move focused window to the top left of the screen --
hs.hotkey.bind(alternateWindowModifierKeys,"Left",topLeftWindow)

-- Move focused window to the top right of the screen --
hs.hotkey.bind(alternateWindowModifierKeys,"Right",topRightWindow)

-- Move focused window to the bottom left of the screen --
hs.hotkey.bind(bottomWindowModifierKeys,"Left",bottomLeftWindow)

-- Move focused window to the bottom right of the screen --
hs.hotkey.bind(bottomWindowModifierKeys,"Right",bottomRightWindow)

-- Set focused window to full screen --
hs.hotkey.bind(windowModifierKeys,"F",setFullscreenWindow)

-- Switch Apps -- 
hs.hotkey.bind({"alt"},"Up",focusWinodwN)
hs.hotkey.bind({"alt"},"Down",focusWindowS)
hs.hotkey.bind({"alt"},"Right",focusWindowE)
hs.hotkey.bind({"alt"},"Left",focusWindowW)

-- [ Misc ] --
-- Lock the screen -- 
hs.hotkey.bind(masterModifierKeys,"L",lockScreen)

-- Start Dev Setup --
hs.hotkey.bind(masterModifierKeys,"D",devSetup)
